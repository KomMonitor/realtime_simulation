import json
import time
from kafka import KafkaConsumer
from kafka.errors import KafkaError
import paho.mqtt.client as mqtt

# Konfiguration
KAFKA_BROKER = 'kafka:9092'
KAFKA_TOPIC = 'deliverydata'
MQTT_BROKER = 'hivemq'
MQTT_PORT = 1883
MQTT_TOPIC = 'node-red/deliverydata'

def create_consumer():
    consumer = None
    while consumer is None:
        try:
            consumer = KafkaConsumer(
                KAFKA_TOPIC,
                bootstrap_servers=[KAFKA_BROKER],
                auto_offset_reset='earliest',
                group_id='delivery-bridge-group',
                value_deserializer=lambda m: json.loads(m.decode('utf-8'))
            )
            consumer.topics()  # Testet die Verbindung
            print("Delivery Bridge: Kafka Consumer verbunden.")
        except KafkaError as e:
            print("Delivery Bridge: Kafka Consumer konnte nicht verbunden werden, retry in 5s. Fehler:", e)
            time.sleep(5)
    return consumer

def bridge():
    consumer = create_consumer()
    mqtt_client = mqtt.Client()
    mqtt_client.connect(MQTT_BROKER, MQTT_PORT, 60)
    mqtt_client.loop_start()
    print("Delivery Bridge: Lese von Kafka und leite weiter an MQTT ...")
    for msg in consumer:
        payload = json.dumps(msg.value)
        mqtt_client.publish(MQTT_TOPIC, payload)
        print("Delivery Bridge: Forwarded to MQTT:", payload)

if __name__ == '__main__':
    bridge()
