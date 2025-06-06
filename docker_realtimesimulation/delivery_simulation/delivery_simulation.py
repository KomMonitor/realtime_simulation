import time
import json
import random
import datetime
import math
import networkx as nx
from kafka import KafkaProducer
from kafka.errors import KafkaError

# -------------------------------
# Parameter und Konstanten
# -------------------------------

SPEED_KMH = 20.0
SPEED_MPS = SPEED_KMH / 3.6         # ca. 1.389 m/s
UPDATE_INTERVAL = 1                 # Positionsupdate alle 1 Sekunde

# Kafka-Konfiguration
KAFKA_BROKER = 'kafka:9092'
TOPIC = 'deliverydata'

# -------------------------------
# Hilfsfunktionen: Distanz, Interpolation & Snap
# -------------------------------
def euclidean_distance(p1, p2):
    """Berechnet die euklidische Distanz zwischen zwei Punkten."""
    return math.sqrt((p1[0]-p2[0])**2 + (p1[1]-p2[1])**2)

def interpolate(p1, p2, fraction):
    """Berechnet einen interpolierten Punkt zwischen p1 und p2, gegebenen Anteil fraction (0.0 bis 1.0)."""
    return (p1[0] + fraction * (p2[0]-p1[0]), p1[1] + fraction * (p2[1]-p1[1]))

def snap_to_graph(point, graph):
    """Ermittelt den nächstgelegenen Knoten im Graphen zu 'point'."""
    return min(graph.nodes(), key=lambda n: euclidean_distance(n, point))

# -------------------------------
# Kafka Producer Setup
# -------------------------------
def create_producer(broker, topic, retries=10, delay=5):
    for attempt in range(retries):
        try:
            producer = KafkaProducer(
                bootstrap_servers=[broker],
                value_serializer=lambda v: json.dumps(v).encode('utf-8')
            )
            producer.partitions_for(topic)
            print("Delivery Simulation: Kafka Producer verbunden.")
            return producer
        except KafkaError as e:
            print(f"Kafka Producer konnte nicht verbunden werden, retry in {delay}s (Versuch {attempt+1}/{retries}). Fehler: {e}")
            time.sleep(delay)
    raise Exception("Kafka-Broker nicht erreichbar.")

producer = create_producer(KAFKA_BROKER, TOPIC)

# -------------------------------
# Laden der GeoJSON-Daten
# -------------------------------
# Homepoint: enthält den Supermarkt (type=1) und Zielpunkte (type=2)
with open("Homepoint.geojson", "r") as f:
    homepoint_geo = json.load(f)

# Streetnetwork: enthält Liniensegmente des Straßennetzes; in den Eigenschaften ist in "length" die Segmentlänge angegeben
with open("Streetnetwork.geojson", "r") as f:
    streetnetwork_geo = json.load(f)

# -------------------------------
# Aufbau des Straßennetzes als Graph (NetworkX)
# -------------------------------
G = nx.Graph()

def process_line(coords, feature):
    """Verarbeitet einen LineString (Liste von Koordinaten) und fügt Kanten zum Graphen hinzu."""
    if len(coords) == 2:
        p1 = tuple(coords[0])
        p2 = tuple(coords[1])
        length = feature["properties"].get("length")
        if not length:
            length = euclidean_distance(p1, p2)
        G.add_edge(p1, p2, weight=length)
    else:
        total_length = feature["properties"].get("length")
        if total_length:
            seg_length = total_length / (len(coords) - 1)
        else:
            seg_length = None
        for i in range(len(coords)-1):
            p1 = tuple(coords[i])
            p2 = tuple(coords[i+1])
            if seg_length is None:
                seg_length = euclidean_distance(p1, p2)
            G.add_edge(p1, p2, weight=seg_length)

for feature in streetnetwork_geo["features"]:
    geometry = feature["geometry"]
    if geometry["type"] == "LineString":
        coords = geometry["coordinates"]
        process_line(coords, feature)
    elif geometry["type"] == "MultiLineString":
        for linestring in geometry["coordinates"]:
            process_line(linestring, feature)

# Debug-Ausgabe: Anzahl Knoten im Graphen
print("Anzahl Knoten im Graphen:", len(G.nodes()))

# -------------------------------
# Extrahieren der Homepoints
# -------------------------------
origin = None
destinations = []
for feature in homepoint_geo["features"]:
    props = feature["properties"]
    coords = tuple(feature["geometry"]["coordinates"])
    # Annahme: type 1 = Supermarkt (Ausgangspunkt), type 2 = Zielpunkte (Lieferadressen)
    if str(props.get("type")) == "1":
        origin = coords
    elif str(props.get("type")) == "2":
        destinations.append(coords)

if origin is None:
    raise Exception("Kein Ausgangspunkt (Supermarkt) in Homepoint.geojson gefunden.")
if not destinations:
    raise Exception("Keine Zielpunkte in Homepoint.geojson gefunden.")

# -------------------------------
# Simulation: Routenplanung und Fahrzeugbewegung
# -------------------------------
current_position = origin
current_route = []       # Liste von Knoten (Koordinaten), die den aktuellen Weg darstellen
segment_index = 0        # Index des aktuellen Segments in current_route
segment_progress = 0.0   # Zurückgelegte Strecke auf dem aktuellen Segment (in Meter)
phase = "to_destination" # Phasen: "to_destination" und "to_origin"
target = None            # Aktuelles Ziel (zufälliger Zielpunkt oder Supermarkt)

print("Starte Delivery Vehicle Simulation ...")

while True:
    # Falls kein aktueller Weg vorhanden ist, berechne einen neuen
    if not current_route:
        if phase == "to_destination":
            target = random.choice(destinations)
        else:  # Rückfahrt zum Supermarkt
            target = origin
        try:
            # Wende den Snap-to-Graph-Ansatz an
            snapped_source = snap_to_graph(current_position, G)
            snapped_target = snap_to_graph(target, G)
            current_route = nx.shortest_path(G, source=snapped_source, target=snapped_target, weight='weight')
            print(f"Neuer Weg von {snapped_source} zu {snapped_target} berechnet: {current_route}")
        except Exception as e:
            print("Routing-Fehler:", e)
            break
        segment_index = 0
        segment_progress = 0.0

    # Bewegung entlang der berechneten Route (falls Route mindestens zwei Knoten enthält)
    if len(current_route) >= 2:
        p1 = current_route[segment_index]
        p2 = current_route[segment_index+1]
        seg_length = euclidean_distance(p1, p2)
        move_distance = SPEED_MPS * UPDATE_INTERVAL
        remaining_distance = seg_length - segment_progress

        if move_distance < remaining_distance:
            segment_progress += move_distance
            frac = segment_progress / seg_length
            current_position = interpolate(p1, p2, frac)
        else:
            current_position = p2
            segment_index += 1
            segment_progress = 0.0
            # Ziel erreicht, wenn Route zu Ende
            if segment_index >= len(current_route) - 1:
                msg = {
                    "timestamp": datetime.datetime.now().isoformat(),
                    "vehicle_id": "delivery_1",
                    "phase": phase,
                    "position": current_position,
                    "status": "arrived"
                }
                producer.send(TOPIC, value=msg)
                print("Angekommen bei Ziel:", target)
                
                # Simuliere eine Pause (Lieferzeit) – z. B. 10 bis 30 Sekunden
                pause_duration = random.uniform(10, 30)
                pause_start = time.time()
                while time.time() - pause_start < pause_duration:
                    pause_msg = {
                        "timestamp": datetime.datetime.now().isoformat(),
                        "vehicle_id": "delivery_1",
                        "phase": phase,
                        "position": current_position,
                        "status": "stationary"
                    }
                    producer.send(TOPIC, value=pause_msg)
                    print("Pause (stationär):", pause_msg)
                    producer.flush()
                    time.sleep(1)
                
                # Phase wechseln: "to_destination" <-> "to_origin"
                phase = "to_origin" if phase == "to_destination" else "to_destination"
                current_route = []
                continue

    # Sende regelmäßige Positionsupdates während der Bewegung
    update_msg = {
        "timestamp": datetime.datetime.now().isoformat(),
        "vehicle_id": "delivery_1",
        "phase": phase,
        "position": current_position,
        "status": "moving"
    }
    producer.send(TOPIC, value=update_msg)
    print("Update:", update_msg)
    producer.flush()
    time.sleep(UPDATE_INTERVAL)
