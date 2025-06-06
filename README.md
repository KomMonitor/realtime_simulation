# QUDI_RealTimeData

In dieser Dockerumgebung werden innerhalb eines Python Skriptes verschiedene Echtzei-Simulationsdaten in einem vordefinierten Quartier in Herne simuliert. Die Simulationsergebnisse werden als Datenstrom zunächst über einen Kafkabroker konsumiert und dann über HiveMQ wieder als MQTT Strom zur Verfügung gestellt. Des Weiteren ist Zookeeper angelegt worden um ein Kafka Cluster zu bilden, um mehrere Simulationen in der gleichen Umgebung anlegen zu können. 

Es werden simuliert: stündliche Stromverbrauchsdaten der Wohnhäuser; Ein- und ausfahrende Fahrzeuge (Auto, LKW, Fahrrad) an drei Messstellen; Ein Deliverybot, der Waren vom Supermarkt zu Haushalten bringt.

Über

```
docker-compose up --build
```

baust du die Docker-Images und startest sämtliche Container der Umgebung.

Über 

```
http://localhost:5000/stream 
```
können die Ergebnisse der Simulation als Messages des Kafka Brokers eingesehen werden.

## Weitere Hinweise

* Die Web-Oberfläche des MQTT-Brokers erreichst du unter [http://localhost:8080](http://localhost:8080).
* Eine kleine Karte zur Visualisierung der Delivery-Simulation läuft auf [http://localhost:8081](http://localhost:8081).
* Über [http://localhost:8082](http://localhost:8082) kann optional die Timescale-Datenbank via pgAdmin verwaltet werden.

## Simulation des Stromverbrauchs
Die Simulation des Stromverbrauchs beruht im wesentlichen auf den tatsächlichen Grundflächen der Wohngebäude, davon ausgehend geschätzten Bewohneranzahlen und Verbrauchsannahmen die sich an Jahreszeiten, Wochentagen, Uhrzeiten oder extremen Verbrauchern orientiert. Ausgehend von den Simulationsergebnissen ist nicht auf tatsächliche Verbräuche im Quartier zu schließen. 

## Simulation des Mobility Counters
Die Mobility-Simulation erzeugt Fahrzeugbewegungen an drei definierten Messstellen
im Quartier. Abhängig von Tageszeit, Wochenendfaktoren und Saison werden
stochastisch Einfahrten pro Stunde berechnet. Jedes Fahrzeug erhält eine
Verweildauer und ein Ziel, sodass neben Einfahrt‑ auch Abfahrtsereignisse
entstehen. Die Ereignisse werden fortlaufend an Kafka unter dem Topic
`mobilitydata` gesendet.

## Simulation des Delivery Bots
Ein Lieferfahrzeug startet am Supermarkt und fährt zufällige Haushalte an. Die
Routenplanung erfolgt auf Basis eines einfachen Straßennetzes, die Position des
Fahrzeugs wird sekündlich aktualisiert. Sobald ein Ziel erreicht ist, wird eine
kurze Lieferpause simuliert, anschließend geht es zurück oder zum nächsten
Haushalt. Alle Positionsupdates werden als Kafka‑Nachrichten im Topic
`deliverydata` veröffentlicht.

## MQTT-Anbindung via Kafka-MQTT-Bridge

Es wird eine Bridge verwendet, die den in Kafka verarbeiteten Datenstrom abgreift und diesen an einen HiveMQ MQTT-Broker weiterleitet.

Die für den MQTT-Zugriff relevanten Parameter sind:

- **MQTT-Broker:** `hivemq` (im Docker-Netzwerk; alternativ die entsprechende IP/Domain, falls von außen erreichbar)
- **Port:** `1883` (Standardport für unverschlüsselte MQTT-Verbindungen)
- **Topic:** `node-red/stromdaten`;`node-red/deliverydata`;`node-red/mobilitydata`
- **Nachrichtenformat:** JSON
