# Docker Real-Time Simulation Environment

Dieses Repository stellt eine Docker-basierte Umgebung bereit, in der unterschiedliche Python-Skripte Echtzeitdatenströme innerhalb eines Stadtquartiers simulieren. Die erzeugten Daten werden zunächst in Kafka verarbeitet und anschließend über HiveMQ als MQTT-Stream zur Verfügung gestellt. Zookeeper dient dabei der Koordination eines kleinen Kafka-Clusters, sodass mehrere Simulationen parallel laufen können.

## Inhalte des Repository

* **energyconsumption_simulation** – generiert stündliche Stromverbrauchsdaten der Wohngebäude
* **mobility_simulation** – simuliert ein- und ausfahrende Fahrzeuge an drei Messstellen
* **delivery_simulation** – bewegt einen Lieferbot vom Supermarkt hin zu zufällig ausgewählten Gebäuden und zurück
* **\*_bridge** – leiten Daten aus Kafka an den MQTT‑Broker weiter
* **energyconsumption_consumer** – stellt einen einfachen HTTP-Endpunkt zum Mitlesen der Daten bereit
* **mqtt_to_db** – schreibt MQTT-Nachrichten in eine TimescaleDB (optional)
* **delivery_webmap** – Einfache Webkarte zur Visualisierung der Bot-Bewegungen (optional)

Die zentrale Orchestrierung erfolgt über `docker-compose.yml`.

## Starten der Umgebung

```bash
docker-compose up --build
```

Damit werden alle Images gebaut und sämtliche Container gestartet. Anschließend stehen folgende Dienste bereit:

* Kafka unter `localhost:9092` (externer Zugriff über Port 29092)
* HiveMQ unter [http://localhost:8080](http://localhost:8080)
* Stromdaten-Stream via HTTP unter [http://localhost:5000/stream](http://localhost:5000/stream)
* Delivery-Webkarte unter [http://localhost:8081](http://localhost:8081)
* pgAdmin für die Timescale-Datenbank unter [http://localhost:8082](http://localhost:8082)

## MQTT-Anbindung

Über eine Bridge werden die in Kafka verarbeiteten Datenströme an HiveMQ weitergeleitet. Relevante Parameter:

- **Broker**: `hivemq`
- **Port**: `1883`
- **Topics**: `node-red/stromdaten`, `node-red/deliverydata`, `node-red/mobilitydata`
- **Format**: JSON

Die optional aktivierbare Komponente `mqtt_to_db` kann sämtliche MQTT-Nachrichten zusätzlich in einer TimescaleDB persistieren. Die Zugangsdaten lassen sich über Umgebungsvariablen konfigurieren (siehe `docker-compose.yml`).

