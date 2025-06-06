from flask import Flask, jsonify, send_from_directory
import psycopg2
import os

app = Flask(__name__, static_folder='static', static_url_path='')

# Funktion, um eine Datenbankverbindung aufzubauen
def get_db_connection():
    conn = psycopg2.connect(
        host=os.getenv("DB_HOST", "timescaledb"),
        port=os.getenv("DB_PORT", "5432"),
        user=os.getenv("DB_USER", "youruser"),
        password=os.getenv("DB_PASSWORD", "yourpassword"),
        dbname=os.getenv("DB_NAME", "yourdb")
    )
    return conn

# REST-Endpoint: Liefert den aktuellsten Delivery-Datensatz
@app.route('/api/deliverydata')
def delivery_data():
    conn = get_db_connection()
    cur = conn.cursor()
    # Hier wird der neueste Eintrag für den Delivery Bot abgefragt (anpassen, falls notwendig)
    cur.execute("""
        SELECT payload
        FROM mqtt_data
        WHERE topic = 'node-red/deliverydata'
        ORDER BY timestamp DESC
        LIMIT 1;
    """)
    row = cur.fetchone()
    cur.close()
    conn.close()
    if row:
        return jsonify(row[0])
    else:
        return jsonify({}), 404

# REST-Endpoint: Liefert aktuelle Energieverbrauchsdaten als Mapping: { FID: consumption }
@app.route('/api/energydata')
def energy_data():
    conn = get_db_connection()
    cur = conn.cursor()
    # Abfrage: Liefert alle Datensätze für Stromdaten (anpassen, falls nötig)
    cur.execute("""
        SELECT (payload->>'FID')::numeric as fid, (payload->>'consumption_kWh')::numeric as consumption
        FROM mqtt_data
        WHERE topic = 'node-red/stromdaten'
        ORDER BY timestamp DESC;
    """)
    rows = cur.fetchall()
    cur.close()
    conn.close()
    data = {}
    for row in rows:
        data[str(row[0])] = float(row[1])
    return jsonify(data)

# Standardroute: Liefert die index.html aus dem static-Ordner
@app.route('/')
def index():
    return app.send_static_file('index.html')

if __name__ == '__main__':
    # Starte den Flask-Server auf Port 80 (intern)
    app.run(host='0.0.0.0', port=80)
