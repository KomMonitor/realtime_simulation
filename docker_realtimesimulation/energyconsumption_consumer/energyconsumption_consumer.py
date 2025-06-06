import time
import json
import threading
from flask import Flask, Response
from kafka import KafkaConsumer
from kafka.errors import KafkaError

app = Flask(__name__)

KAFKA_BROKER = 'kafka:9092'
TOPIC = 'stromdaten'

# In-Memory-Speicher für empfangene Nachrichten
messages = []

def create_consumer(broker, topic, retries=10, delay=5):
    for attempt in range(retries):
        try:
            consumer = KafkaConsumer(
                topic,
                bootstrap_servers=[broker],
                auto_offset_reset='earliest',
                group_id='consumer-group-1',
                value_deserializer=lambda m: json.loads(m.decode('utf-8'))
            )
            # Verbindung testen
            consumer.topics()
            print("Kafka Consumer verbunden.")
            return consumer
        except Exception as e:
            print(f"Kafka Consumer konnte nicht verbunden werden, versuche es in {delay} Sekunden erneut (Versuch {attempt+1}/{retries}). Fehler: {e}")
            time.sleep(delay)
    raise Exception("Kafka-Broker nach mehreren Versuchen nicht erreichbar.")

def consume_messages():
    consumer = create_consumer(KAFKA_BROKER, TOPIC, retries=10, delay=5)
    for msg in consumer:
        messages.append(msg.value)
        # Behalte nur die letzten 1000 Nachrichten
        if len(messages) > 1000:
            messages.pop(0)

# Starte den Kafka-Consumer in einem Hintergrund-Thread
threading.Thread(target=consume_messages, daemon=True).start()

def event_stream():
    last_index = 0
    while True:
        if len(messages) > last_index:
            for msg in messages[last_index:]:
                yield f"data: {json.dumps(msg)}\n\n"
            last_index = len(messages)
        time.sleep(1)

@app.route('/stream')
def stream():
    return Response(event_stream(), mimetype='text/event-stream')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
