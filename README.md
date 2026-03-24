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
Alle Anwendungen der Realtime Simulation können innerhalb des [./docker_realtimesimulation](./docker_realtimesimulation) 
Verzeichnis gebaut werden mit:
```bash
docker compose --profile "*" build
```
## Bauen des Web Clients
Um den KomMonitor Web Client mit Echtzeit-Features zu bauen:
```bash
docker build -t kommonitor/web-client-ng-realtime https://github.com/KomMonitor/web-client.git#feature/real-time-data
```

## Startup
### Starten der Middleware
Bevor die Realtime Siulation gestartet werden kann, müssen zunächst alle Middleware-Komponenten laufen. Hierzu im
Verzeichnis [./services](./services) die Komponenten per Docker Compose starten:
```bash
docker compose up 
```
Folgende Dienste stehen anschließend bereit:
* Kafka unter `localhost:9092` (externer Zugriff über Port 29092)
* HiveMQ unter [http://localhost:8080](http://localhost:8080)
* Node-RED unter [http://localhost:1880](http://localhost:1880)
* TimescaleDB unter `localhost:5434`
* pgAdmin für die Timescale-Datenbank unter [http://localhost:8082](http://localhost:8082)

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

#### MQTT-Anbindung

Über eine Bridge werden die in Kafka verarbeiteten Datenströme an HiveMQ weitergeleitet. Relevante Parameter:

- **Broker**: `hivemq`
- **Port**: `1883`
- **Topics**: `node-red/stromdaten`, `node-red/deliverydata`, `node-red/mobilitydata`
- **Format**: JSON

Die optional aktivierbare Komponente `mqtt_to_db` kann sämtliche MQTT-Nachrichten zusätzlich in einer TimescaleDB
persistieren. Die Zugangsdaten lassen sich über Umgebungsvariablen konfigurieren (siehe `docker-compose.yml`).

## Demo Use Cases
### Konfiguration der Node-RED Flows
Die Node-RED Flows sind standardmäßig für das bereitgestellte Docker Setup konfiguriert. Generell lassen sich die 
Flows jedoch auch an andere Umgebunden anpassen.

#### Environment Variablen
Zu diesem Zwecke müssen folgende Environment Variablen innerhalb der Node-RED 
Instanz unter *Einstellungen -> Environment* gesetzt werden:

| Env Variable                     | Description                                       | Example                                                              |
|----------------------------------|---------------------------------------------------|----------------------------------------------------------------------|
| `KEYCLOAK_URL`                   | Root URL zu Keycloak.                             | http://keycloak:8080                                                 |
| `REALM_NAME`                     | Keycloak Realm Name.                              | kommonitor                                                           |
| `KEYCLOAK_ACCESS_TOKEN_URL`      | URL zum Keycloak Token Endpunkt                   | http://keycloak:8080/realms/kommonitor/protocol/openid-connect/token |
| `KOMMONITOR_DATA_MANAGEMENT_URL` | Root URL zur KomMonitor Data Management API       | http://kommonitor-data-management:8085                               |
| `KOMMONITOR_TIMESERIES_API_URL`  | Root URL zur KomMonitor Timeseries API            | http://kommonitor-timeseries-management:8086                         |

#### KomMonitor Config Daten
Der Node-RED Flow *01 - Spatio-temporal Aggregation* benötigt außerdem Informationen darüber, für welche
Indikatoren und Raumebenen die aggregierte Zeitreihendaten hinzugefügt werden sollen. Die Informationen werden
in der Config-Datei unter [./services/nodered/data/config.json](./services/nodered/data/config.json) bereitgestellt.
Diese Datei beinhaltet folgende Parameter:

`indicatorMapping`:   
Liste mit Mappings zwischen aggregierten Parametern im Node-RED Flow (`parameter`) und
der Indikator ID in KomMonitor (`indicator`). Metdaten zu allen hier aufgeführten Indikatoren müssen vorab in
KomMonitor angelegt worden sein.

`spatialUnits`:   
Liste mit Raumebenen, für die eine Aggregation erfolgen soll. `id` und `name` entsprechen den Metadateninformationen
zu den Raumebenen in KomMonitor.

### 01 - Spatio-temporal Aggregation
Der Node-RED Flow **01 - Spatio-temporal Aggregation** empfängt Stramoverbrauchsdaten von einem MQTT-Stream und
aggregiert diese zu Tageswerten. Der Flow ist in mehrere Sub-Flows unterteilt, wobei einige der Sub-Flows
Kontextinformationen für den Hauptflow (04 - Aggregate Energy Consumption) setzen. Jeder Flow startet mit einem 
Inject-Knoten, der auch manuell getriggert werde kann. Zur Nutzung des Flows sollte wie folgt vorgegangen werden:

#### 01 - KomMonitor Config Daten setzen
Um die KomMonitor Config Datei [./services/nodered/data/config.json](./services/nodered/data/config.json) auszulesen 
und Mapping Informationen zu setzen, kann der *Inject Mapping File* Knoten des *01 - Read KomMonitor Config* Flows
ausgeführt werden.

#### 02 - Keycloak Authentifizierung
Um Daten aus der KomMonitor Data Management API auszulesen und die aggregierten Indikator-Zeitreihen zu speichern,
ist ein Keycloak Token notwendig. Dieser kann über den Subflow **02 - Keycloak Authentication** abgerufen und als 
Kontextinformation gesetzt werden. Der Knoten *KomMonitor Auth* enthält wichtige Verbindungsparameter für Keycloak
und muss ggf. angepasst werden.

#### 03 - KomMonitor Raumebenen abrufen
Der Subflow **03 - Request and Store Spatial Units** ruft die in der KomMonitor Config Datei
[./services/nodered/data/config.json](./services/nodered/data/config.json) definiereten Raumebenen ab.
Diese werden im Hauptflow für die Durchführung der räumlichen Aggregation verwendet.

#### 04 - Raum-zeitliche Aggregation von Stromverbrauchsdaten
Die gesamte Anwendungslogik steckt im Hauptflow **04 - Aggregate Energy Consumption**. Dieser geht wie folgt vor:  

1. Ein MQTT-Inject Knoten empfängt Nachrichten zu Stromverbrauchstdaten, die über den HiveMQ Broker unter dem Topic
*node-red/stromdaten* veröffentlicht werden.  

2. Die Knoten *Reset Timer*, *Fire Timer Finished* und *Wait for Timer Finished* sorgen dafür, dass alle MQTT-Nachrichten
für eine bestimmte Zeit gesammelt werden, bevor die raum-zeitliche Aggregation erfolgt. Über den *Reset Timer* Knoten,
kann dieses Zeitintervall gesetz werdenb. Wenn etwa eine Aggregation zu Tageswerten gewünscht ist, müsste die 
Wiederholungsrate auf einen festen täglichen Zeitpunkt z.B. `0:01` (kleiner zeitlicher Lag, um sicherzustellen, dass 
verspätete Nachrichten des vergangenen Tages mit berücksichtigt werden). Für den simulierten Use Case sollte ein 
geringeres Zeitintervall gesetzt werden, das auch zum Simulationsintervall passt.

3. Die raum-zeitliche Aggregation kann auch ohne vorherigen MQTT-Input angestoßen werden. Hierzu lassen sich
über den *Inject Test Data* Knoten einige Testdaten manuell injecten.

4. Im Knoten *Daily Aggregation* erfolgt eine zeitliche Aggregation der Stromverbrauchsdaten unter Berücksichtigung
aller bis zum Trigger-Zeitpunkt eingelaufenen MQTT-Nachrichten pro Wohngebäude.

5. Der Knoten *Loop for Spatial Units* sorgt dafür, dass für jede in der KomMonitor Config Datei hinterlegte
Raumebne die räumliche Aggregation durchgeführt wird.

6. Im Knoten *Spatial Aggregation* erfolgt die räumliche Aggregation der zuvor zeitliche aggregierten Stromverbrauchsdaten
von Gebäuden. Hierzu wird für jedes Raumeinheiten-Feature einer Raumebene ermittelt, welche Gebäude innerhalb des 
Feature-Polygons liegen, und über alle zeitliche aggregierten Stromverbrauchsdaten des Gebäudes eine räumliche Aggregation
durchgeführt. Es werden vier verschiedene aggregierte Metriken ermittelt:  *Durchschnittlicher stündlicher Energieverbrauch*, *Durchschnittlicher täglicher Energieverbrauch Gebäude*, *Gesamter täglicher Energieverbrauch Gebäude*
und *Kumulierter durchschnittlicher stündlicher Energieverbrauch Gebäude*.

7. Der Knoten *Create Multiple Indicator Update Requests* überführt die aggregierten Zeitreihendaten in das von der
KomMonitor Data Management API erwartete Datenschema und stellt für jede der aggregierten Metriken einen entsprechenden
API Request zum Update der Zeitreihen des entsprechenden Indikators zusammen.

8. Im Knoten *Update Indicator* wird der API Request zum Update der Indikatorzeitreihen durchgeführt.

### 02 - Timeseries Harvesting
Der Node-RED Flow *02 - Timeseries Harvesting* empfängt dagegen Messwerte von
Klimamessstationen und speichert die Rohwerte in einer Timeseriees Datenbank.
