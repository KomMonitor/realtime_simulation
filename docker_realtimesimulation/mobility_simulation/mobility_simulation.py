import time
import json
import random
import datetime
import numpy as np
from kafka import KafkaProducer
from kafka.errors import KafkaError

# -------------------------------
# Konfiguration
# -------------------------------

# Kafka-Konfiguration
KAFKA_BROKER = 'kafka:9092'
TOPIC = 'mobilitydata'

# Basisankunftsrate pro Station (Fahrzeuge pro Stunde)
base_rates = {
    "1": 250,
    "2": 250,
    "3": 100
}

# Fahrzeugtypen und ihre Verteilungen
vehicle_types_main = ['PKW', 'LKW', 'Bike']
vehicle_proportions_main = [0.93, 0.05, 0.02]
vehicle_types_standard = ['PKW', 'LKW', 'Bike']
vehicle_proportions_standard = [0.90, 0.04, 0.06]

# Transitwahrscheinlichkeiten pro Station
transit_probabilities = {
    "1": 0.4,
    "2": 0.4,
    "3": 0.1
}

# -------------------------------
# Funktionen: Einflussfaktoren
# -------------------------------

def arrival_rate(dt, station):
    """
    Berechnet die Anzahl externer Ankünfte (Fahrzeuge pro Stunde) an einer Station unter Berücksichtigung:
    - Tageszeit (Stoßzeiten vs. Nebenzeiten)
    - Nachtstunden (22-6 Uhr, stark reduziert)
    - Wochenenden (reduzierter Verkehr)
    - Saisonale Effekte (Winter/Sommer)
    - Zufällige Schwankungen (±10%)
    """
    base_rate = base_rates[station]
    hour = dt.hour

    # Tageszeit-Faktor
    if 7 <= hour < 9 or 16 <= hour < 18:
        factor = 1.5
    elif 10 <= hour < 15:
        factor = 1.2
    else:
        factor = 0.8

    # Nachtstunden: starker Abfall
    if hour < 6 or hour >= 22:
        factor *= 0.3

    # Wochenenden: weniger Verkehr
    if dt.weekday() >= 5:
        factor *= 0.7

    # Saisonale Anpassung: Winter vs. Sommer
    month = dt.month
    if month in [12, 1, 2]:
        factor *= 0.9
    elif month in [6, 7, 8]:
        factor *= 1.1

    # Zufälliger Schwankungsfaktor
    random_factor = random.uniform(0.90, 1.10)
    
    return base_rate * factor * random_factor  # Fahrzeuge pro Stunde (float)

def sample_dwell_time(vehicle_type, is_transit):
    """
    Bestimmt die Verweildauer (in Minuten) eines Fahrzeugs:
    - Transit: Gleichverteilt zwischen 1 und 10 Minuten.
    - Nicht-Transit: Exponentiell verteilt (mindestens 10 Minuten) mit typischen Mittelwerten pro Fahrzeugtyp.
    """
    if is_transit:
        return random.uniform(1, 10)
    else:
        if vehicle_type == 'PKW':
            mean = 60
        elif vehicle_type == 'LKW':
            mean = 90
        elif vehicle_type == 'Bike':
            mean = 30
        dwell = np.random.exponential(mean)
        return max(dwell, 10)

def select_destination_transit(origin):
    """
    Wählt für Transit-Fahrzeuge als Ziel eine andere Station.
    Gewichtung: Bei Station 1: 70% zu Station 2, 30% zu Station 3; Station 2 ähnlich; Station 3 gleich verteilt.
    """
    if origin == "1":
        dests = ["2", "3"]
        weights = [0.7, 0.3]
    elif origin == "2":
        dests = ["1", "3"]
        weights = [0.7, 0.3]
    elif origin == "3":
        dests = ["1", "2"]
        weights = [0.5, 0.5]
    return random.choices(dests, weights=weights, k=1)[0]

def select_destination_nontransit(origin, dwell):
    """
    Für Nicht-Transit-Fahrzeuge:
    - Bei längeren Verweildauern steigt die Chance, dass das Fahrzeug an derselben Station abfährt.
    - Andernfalls wird aus den übrigen Stationen (mit festen Gewichtungen) zufällig gewählt.
    """
    p_same = 0.6 if dwell >= 90 else 0.3
    if random.random() < p_same:
        return origin
    else:
        others = [s for s in ["1", "2", "3"] if s != origin]
        if origin == "1":
            weights = [0.7, 0.3]
        elif origin == "2":
            weights = [0.7, 0.3]
        elif origin == "3":
            weights = [0.5, 0.5]
        return random.choices(others, weights=weights, k=1)[0]

# -------------------------------
# Kafka-Producer Setup
# -------------------------------

def create_producer(broker, topic, retries=10, delay=5):
    for attempt in range(retries):
        try:
            producer = KafkaProducer(
                bootstrap_servers=[broker],
                value_serializer=lambda v: json.dumps(v).encode('utf-8')
            )
            producer.partitions_for(topic)
            print("Mobility Simulation: Kafka Producer verbunden.")
            return producer
        except KafkaError as e:
            print(f"Kafka Producer konnte nicht verbunden werden, retry in {delay}s (Versuch {attempt+1}/{retries}). Fehler: {e}")
            time.sleep(delay)
    raise Exception("Kafka-Broker nicht erreichbar.")

producer = create_producer(KAFKA_BROKER, TOPIC)

# -------------------------------
# Simulation Setup
# -------------------------------

dt = 1  # Simulationsschritt in Sekunden
global_state = {"PKW": 0, "LKW": 0, "Bike": 0}  # Globaler Zähler für Fahrzeuge im Quartier

# Liste für geplante Abfahrtsereignisse
pending_departures = []  # Jedes Element: {'departure_time': datetime, 'origin': station, 'destination': destination, 'vehicle_type': type}

print("Starte kontinuierliche Mobility-Simulation mit erweiterten Einflussfaktoren ...")

while True:
    current_time = datetime.datetime.now()
    
    # -------------------------------
    # Verarbeitung von Abfahrtsereignissen (Fahrzeuge, deren Verweildauer abgelaufen ist)
    # -------------------------------
    departures_to_process = [d for d in pending_departures if d['departure_time'] <= current_time]
    for event in departures_to_process:
        vehicle_type = event['vehicle_type']
        # Abfahrt nur, wenn globaler Zähler > 0 (sollte immer der Fall sein)
        if global_state[vehicle_type] > 0:
            global_state[vehicle_type] -= 1
        exit_event = {
            "timestamp": current_time.isoformat(),
            "station": event['origin'],
            "event": "exit",
            "vehicle_type": vehicle_type,
            "destination": event['destination'],
            "global_count": global_state[vehicle_type]
        }
        producer.send(TOPIC, value=exit_event)
        print(f"Abfahrt gesendet: {exit_event}")
        pending_departures.remove(event)
    
    # -------------------------------
    # Verarbeitung von Ankunfteereignissen pro Station
    # -------------------------------
    # Für jede Station berechnen wir die Ankunftsrate (Fahrzeuge pro Stunde) und wandeln sie in eine Rate pro Sekunde um.
    for station in ["1", "2", "3"]:
        # Berechne aktuelle Ankunftsrate (Fahrzeuge pro Stunde)
        rate_per_hour = arrival_rate(current_time, station)
        # Umrechnung in Rate pro Sekunde:
        lambda_sec = rate_per_hour / 3600.0
        
        # Ziehe Anzahl an Ankünften in diesem dt (Poisson-Prozess)
        num_arrivals = np.random.poisson(lambda_sec * dt)
        
        for _ in range(num_arrivals):
            # Wähle Fahrzeugtyp je nach Station
            if station in ["1", "2"]:
                vehicle_type = random.choices(vehicle_types_main, weights=vehicle_proportions_main, k=1)[0]
            else:
                vehicle_type = random.choices(vehicle_types_standard, weights=vehicle_proportions_standard, k=1)[0]
            
            # Transitentscheidung
            transit_prob = transit_probabilities[station]
            is_transit = random.random() < transit_prob
            
            # Bestimme Verweildauer in Minuten und konvertiere zu Sekunden
            dwell_minutes = sample_dwell_time(vehicle_type, is_transit)
            dwell_seconds = dwell_minutes * 60
            
            # Bestimme Ziel basierend auf Transit oder Nicht-Transit
            if is_transit:
                destination = select_destination_transit(station)
            else:
                destination = select_destination_nontransit(station, dwell_minutes)
            
            # Update globaler Zähler
            global_state[vehicle_type] += 1
            
            entry_event = {
                "timestamp": current_time.isoformat(),
                "station": station,
                "event": "entry",
                "vehicle_type": vehicle_type,
                "destination": destination,
                "global_count": global_state[vehicle_type]
            }
            producer.send(TOPIC, value=entry_event)
            print(f"Einfahrt gesendet: {entry_event}")
            
            # Plane Abfahrtsereignis
            departure_time = current_time + datetime.timedelta(seconds=dwell_seconds)
            pending_departures.append({
                "departure_time": departure_time,
                "origin": station,
                "destination": destination,
                "vehicle_type": vehicle_type
            })
    
    # Falls in diesem Schritt keine Ein- oder Ausfahrten erfolgen, bleibt es still (realistische Pausen)
    producer.flush()
    time.sleep(dt)
