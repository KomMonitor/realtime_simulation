# Docker Real-Time Simulation Environment

Dieses Repository stellt eine Docker-basierte Umgebung bereit, in der unterschiedliche Python-Skripte 
Echtzeitdatenströme innerhalb eines Stadtquartiers simulieren. Die erzeugten Daten werden zunächst in
Kafka verarbeitet und anschließend über HiveMQ als MQTT-Stream zur Verfügung gestellt. Zookeeper dient
dabei der Koordination eines kleinen Kafka-Clusters, sodass mehrere Simulationen parallel laufen können.

## Inhalte des Repository
### Docker Realtime Simulation
**Directory:** [./docker_realtimesimulation](./docker_realtimesimulation)

* **energyconsumption_simulation** – generiert stündliche Stromverbrauchsdaten der Wohngebäude
* **mobility_simulation** – simuliert ein- und ausfahrende Fahrzeuge an drei Messstellen
* **delivery_simulation** – bewegt einen Lieferbot vom Supermarkt hin zu zufällig ausgewählten Gebäuden und zurück
* **\*_bridge** – leiten Daten aus Kafka an den MQTT‑Broker weiter
* **energyconsumption_consumer** – stellt einen einfachen HTTP-Endpunkt zum Mitlesen der Daten bereit
* **mqtt_to_db** – schreibt MQTT-Nachrichten in eine TimescaleDB (optional)
* **delivery_webmap** – Einfache Webkarte zur Visualisierung der Bot-Bewegungen (optional)

Die zentrale Orchestrierung erfolgt über `docker-compose.yml`.

### KomMonitor
**Directory:** [./kommonitor](./kommonitor)

Beinhaltet ein minimales Docker Compose Setup und Config-Files zum Starten von KomMonitor und Keycloak.
Die KomMonitor Datenbank mit Gebäudendaten als Georessourcen und Raumeinheiten initialisiert

### Services
**Directory:** [./services](./kommonitor)
Beinhaltet ein Docker Compose Setup für Middleware der Realtime Simulation:
* Kafka: Streaming von IoT-Daten der Realtime Simulation
* HiveMQ: Pub/Sub der IoT Daten via MQTT
* Node-RED: Plattform für ETL Flows zur Integration der IoT Datenströme in KomMonitor
* TimescaleDB: Persistierung der IoT Daten als Zeitreihendaten

## Bauen der Realtime Simulation
Alle Anendungen der Realtime Simulation können innerhalb des [./docker_realtimesimulation](./docker_realtimesimulation) 
Verzeichnis gebaut werden mit:
```bash
docker compose build
```

## Startup
### Starten der Middleware
Bevor die Realtime Siulation gestartet werden kann, müssen zunächst alle Middleware-Komponenten laufen. Hierzu im
Verzeichnis [./docker_realtimesimulation](./docker_realtimesimulation) die Komponenten per Docker Compose starten:
```bash
docker compose up 
```
Folgende Dienste stehen anschließend bereit:
* Kafka unter `localhost:9092` (externer Zugriff über Port 29092)
* HiveMQ unter [http://localhost:8080](http://localhost:8080)
* Node-RED unter [http://localhost:1880](http://localhost:1880)
* TimescaleDB unter `localhost:5434`
* pgAdmin für die Timescale-Datenbank unter [http://localhost:8082](http://localhost:8082)

### Starten der Realtime Simulation
Einzelne Komponenten der Realtime Simulation können per Docker Compose im Verzeichnis
[./docker_realtimesimulation](./docker_realtimesimulation) gestartet werden:
```bash
docker compose --profile <profile_name> up 
```
Folgende Profile werden unterstützt, um nur bestimmte Komponenten für verschiedene Use Cases zu starten:
* *energyconsumption*: Generierung von Stromverbrauchsdaten der Wohngebäude
* *delivery*: Lieferbot eines Supermarkts
* *mobility*: Fahrzeugsimulation
* *storage*: Bridge von MQTT nach TimescaleDB

Anschließend stehen folgende Dienste bereit:

* Stromdaten-Stream via HTTP unter [http://localhost:5000/stream](http://localhost:5000/stream)
* Delivery-Webkarte unter [http://localhost:8081](http://localhost:8081)

### Starten von KomMonitor
KomMonitor und Keycloak werden im Verzeichnis [./kommonitor](./kommonitor) gestartet:
```bash
docker compose up 
```

Folgende Dienste sind damit erreichbar:
* KomMonitor Web Client: [http://localhost:8084](http://localhost:8084)
* KomMonitor Data Management API: [http://localhost:8085](http://localhost:8085)
* KomMonitor Importer API: [http://localhost:8087](http://localhost:8087)
* Keycloak [http://localhost:8080](http://localhost:8080)


Das KomMonitor Setup erwartet, dass Keycloak außerdem unter [http://keycloak:8080](http://keycloak:8080) erreichbar ist.
Hierzu muss ggf. die Host-Datei des Betriebssystems angepasst werden, indem folgende Zeile ergänzt wird:
```
127.0.0.1 keycloak
```

## MQTT-Anbindung

Über eine Bridge werden die in Kafka verarbeiteten Datenströme an HiveMQ weitergeleitet. Relevante Parameter:

- **Broker**: `hivemq`
- **Port**: `1883`
- **Topics**: `node-red/stromdaten`, `node-red/deliverydata`, `node-red/mobilitydata`
- **Format**: JSON

Die optional aktivierbare Komponente `mqtt_to_db` kann sämtliche MQTT-Nachrichten zusätzlich in einer TimescaleDB
persistieren. Die Zugangsdaten lassen sich über Umgebungsvariablen konfigurieren (siehe `docker-compose.yml`).

