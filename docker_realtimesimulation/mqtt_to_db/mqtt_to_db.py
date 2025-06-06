import os
import sys
import time
import json
import psycopg2
from psycopg2.extras import Json
import paho.mqtt.client as mqtt

# Umgebungsvariablen laden (Standardwerte sind gesetzt)
MQTT_BROKER = os.getenv('MQTT_BROKER', 'localhost')
MQTT_PORT = int(os.getenv('MQTT_PORT', '1883'))
MQTT_TOPICS = os.getenv('MQTT_TOPICS', 'node-red/#')

DB_HOST = os.getenv('DB_HOST', 'timescaledb')
DB_PORT = os.getenv('DB_PORT', '5432')
DB_USER = os.getenv('DB_USER', 'youruser')
DB_PASSWORD = os.getenv('DB_PASSWORD', 'yourpassword')
DB_NAME = os.getenv('DB_NAME', 'yourdb')

# Debug-Ausgabe der Datenbank-Parameter
print("DB_HOST:", DB_HOST, "DB_PORT:", DB_PORT, "DB_USER:", DB_USER, "DB_NAME:", DB_NAME, flush=True)

def init_db():
    retries = 10
    delay = 5  # Sekunden
    conn = None
    for attempt in range(retries):
        try:
            print("Versuche, Verbindung zur Datenbank aufzubauen... (Versuch {}/{})".format(attempt+1, retries), flush=True)
            conn = psycopg2.connect(
                host=DB_HOST,
                port=DB_PORT,
                user=DB_USER,
                password=DB_PASSWORD,
                dbname=DB_NAME
            )
            print("Erfolgreich mit der Datenbank verbunden.", flush=True)
            break
        except psycopg2.OperationalError as e:
            print("Datenbankverbindung fehlgeschlagen (Versuch {}/{}): {}".format(attempt+1, retries, e), flush=True)
            time.sleep(delay)
    if conn is None:
        print("Maximale Anzahl von Versuchen erreicht. Beende Programm.", flush=True)
        exit(1)
    
    conn.autocommit = True
    cur = conn.cursor()
    # Tabelle droppen (nur in der Entwicklungsphase)
    cur.execute("DROP TABLE IF EXISTS mqtt_data;")
    # Tabelle erstellen mit zusammengesetztem Primary Key (timestamp, id)
    cur.execute("""
    CREATE TABLE mqtt_data (
        id SERIAL,
        timestamp TIMESTAMPTZ NOT NULL,
        topic TEXT NOT NULL,
        payload JSONB NOT NULL,
        PRIMARY KEY (timestamp, id)
    );
    """)
    # Umwandeln in einen Hypertable (TimescaleDB)
    cur.execute("""
    SELECT create_hypertable('mqtt_data', 'timestamp', if_not_exists => TRUE);
    """)
    cur.close()
    return conn

# Datenbank initialisieren
conn = init_db()

def insert_message(topic, payload):
    try:
        cur = conn.cursor()
        # Verwende den in der Nachricht enthaltenen Timestamp oder die aktuelle Zeit
        ts = payload.get('timestamp') or time.strftime('%Y-%m-%dT%H:%M:%SZ', time.gmtime())
        cur.execute(
            "INSERT INTO mqtt_data (timestamp, topic, payload) VALUES (%s, %s, %s)",
            (ts, topic, Json(payload))
        )
        conn.commit()
        cur.close()
    except Exception as e:
        print("Fehler beim Einfügen in die Datenbank:", e, flush=True)

def on_connect(client, userdata, flags, rc):
    print("Mit MQTT Broker verbunden, result code:", rc, flush=True)
    # Abonniere das definierte Topic
    client.subscribe(MQTT_TOPICS)

def on_message(client, userdata, msg):
    try:
        payload = json.loads(msg.payload.decode('utf-8'))
        print("Nachricht empfangen auf {}: {}".format(msg.topic, payload), flush=True)
        insert_message(msg.topic, payload)
    except Exception as e:
        print("Fehler beim Verarbeiten der Nachricht:", e, flush=True)

# MQTT-Client erstellen und Callbacks setzen
client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

# Retry-Mechanismus für MQTT-Verbindung
max_retries_mqtt = 5
retry_delay_mqtt = 5  # Sekunden
attempt = 0

while True:
    try:
        print("Versuche, Verbindung zum MQTT Broker {}:{} herzustellen (Versuch {}/{})...".format(MQTT_BROKER, MQTT_PORT, attempt+1, max_retries_mqtt), flush=True)
        client.connect(MQTT_BROKER, MQTT_PORT, 60)
        break  # Verbindung erfolgreich, Schleife verlassen
    except Exception as e:
        print("MQTT-Verbindungsfehler: {}. Warte {} Sekunden...".format(e, retry_delay_mqtt), flush=True)
        attempt += 1
        if attempt >= max_retries_mqtt:
            print("Maximale Anzahl von MQTT-Versuchen erreicht. Beende Programm.", flush=True)
            exit(1)
        time.sleep(retry_delay_mqtt)

client.loop_forever()
