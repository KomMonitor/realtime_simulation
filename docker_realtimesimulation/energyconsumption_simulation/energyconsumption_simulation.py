import time
import json
import math
import random
from datetime import datetime, timedelta
import numpy as np
import pandas as pd
from kafka import KafkaProducer
from kafka.errors import KafkaError

# Kafka-Konfiguration
KAFKA_BROKER = 'kafka:9092'
TOPIC = 'stromdaten'

# GeoJSON-Daten einlesen
with open('prepared_gebaeude_layer.geojson', 'r', encoding='utf-8') as f:
    geojson_data = json.load(f)

# Erstelle ein DataFrame aus den Features – hier werden nur die Properties extrahiert
df_buildings = pd.json_normalize(geojson_data["features"])
df_buildings = df_buildings.rename(columns={
    "properties.fid": "fid",
    "properties.persons": "persons",
    "properties.grundflaec": "grundflaec",
    "properties.E_Auto": "E_Auto",
    "properties.WPumpe": "WPumpe",
    "properties.Lon": "Lon",
    "properties.Lat": "Lat"
})

# Sicherstellen, dass der Schlüssel "FID" vorhanden ist
if "FID" not in df_buildings.columns and "fid" in df_buildings.columns:
    df_buildings = df_buildings.rename(columns={"fid": "FID"})

# Ergänze die vollständige Geometrie als eigene Spalte
df_buildings["geometry"] = [feature.get("geometry") for feature in geojson_data["features"]]

# ───────────────────────────────
# Faktoren aus dem historischen Skript
# ───────────────────────────────

# Basisverbrauch-Faktoren
weekday_factor = {0: 1.0, 1: 1.0, 2: 1.0, 3: 1.0, 4: 1.1, 5: 1.2, 6: 1.3}
seasonal_factor = {1: 1.2, 2: 1.15, 3: 1.1, 4: 1.0, 5: 0.95, 6: 0.9,
                   7: 0.85, 8: 0.85, 9: 0.9, 10: 1.0, 11: 1.1, 12: 1.15}
hourly_pattern = np.array([
    0.5, 0.4, 0.3, 0.3, 0.4, 0.6, 1.0, 1.2, 1.1, 1.0, 0.9, 0.8,
    0.8, 0.7, 0.8, 0.9, 1.0, 1.3, 1.5, 1.4, 1.2, 1.0, 0.8, 0.6
])
hourly_pattern /= hourly_pattern.sum()

# Zusatzverbrauch E-Autos
base_e_auto_daily = 4.0  # kWh pro E-Auto und Tag
e_car_hourly_pattern = np.zeros(24)
for h in [17, 18, 19, 20]:
    e_car_hourly_pattern[h] = 1.0
e_car_hourly_pattern /= e_car_hourly_pattern.sum()

# Verbrauch der Wärmepumpen
base_wp_factor = 0.09  # kWh pro m² pro WPumpe pro Tag (Beispielwert)
heating_seasonal_factor = {
    1: 1.5, 2: 1.4, 3: 1.2, 4: 1.0, 5: 0.8, 6: 0.5,
    7: 0.3, 8: 0.3, 9: 0.5, 10: 0.8, 11: 1.0, 12: 1.2
}
heating_hourly_pattern = np.array([
    0.03, 0.03, 0.03, 0.03, 0.04, 0.05, 0.06, 0.08,
    0.09, 0.1, 0.09, 0.08, 0.07, 0.06, 0.05, 0.04,
    0.03, 0.03, 0.03, 0.03, 0.02, 0.02, 0.02, 0.02
])
heating_hourly_pattern /= heating_hourly_pattern.sum()

# ───────────────────────────────
# Kafka Producer erstellen (mit Retry-Logik)
# ───────────────────────────────
def create_producer(broker, topic, retries=10, delay=5):
    for attempt in range(retries):
        try:
            producer = KafkaProducer(
                bootstrap_servers=[broker],
                value_serializer=lambda v: json.dumps(v).encode('utf-8')
            )
            # Verbindung testen, indem Topic-Metadaten abgefragt werden
            producer.partitions_for(topic)
            print("Kafka Producer verbunden.")
            return producer
        except KafkaError as e:
            print(f"Kafka nicht erreichbar, versuche es in {delay} Sekunden erneut (Versuch {attempt+1}/{retries}). Fehler: {e}")
            time.sleep(delay)
    raise Exception("Kafka-Broker nach mehreren Versuchen nicht erreichbar.")

producer = create_producer(KAFKA_BROKER, TOPIC, retries=10, delay=5)

# ───────────────────────────────
# Simulation des stündlichen Verbrauchs pro Gebäude
# ───────────────────────────────
def simulate_consumption_for_building(row, current_time):
    # Basisverbrauch (personenabhängig)
    base_daily_consumption = (row["persons"] ** 0.9) * 1500 / 365  # kWh pro Tag
    day_factor = weekday_factor[current_time.weekday()]
    season_factor = seasonal_factor[current_time.month]
    random_variation = np.random.uniform(0.95, 1.05)
    hour = current_time.hour
    building_consumption = base_daily_consumption * day_factor * season_factor * random_variation * hourly_pattern[hour]
    
    # Zusatzverbrauch E-Autos (pro Auto)
    e_auto_random_variation = np.random.uniform(0.95, 1.05)
    e_auto_consumption = row["E_Auto"] * base_e_auto_daily * e_car_hourly_pattern[hour] * e_auto_random_variation
    
    # Verbrauch der Wärmepumpen (gebäude- und grundflächenabhängig)
    heating_random_variation = np.random.uniform(0.95, 1.05)
    base_heatpump_daily = row["WPumpe"] * row["grundflaec"] * base_wp_factor * heating_seasonal_factor[current_time.month]
    heatpump_consumption = base_heatpump_daily * heating_hourly_pattern[hour] * heating_random_variation
    
    total_consumption = building_consumption + e_auto_consumption + heatpump_consumption
    return round(total_consumption, 4)

# Simulierte Startzeit (auf volle Stunde gerundet)
current_time = datetime.now().replace(minute=0, second=0, microsecond=0)
# Alternativ: current_time = datetime(2025, 1, 1, 0, 0, 0)

# Endlosschleife: Jede 10 Sekunden wird eine neue simulierte Stunde berechnet und als Kafka-Nachricht gesendet
while True:
    for idx, row in df_buildings.iterrows():
        consumption = simulate_consumption_for_building(row, current_time)
        data = {
            'timestamp': current_time.isoformat(),
            'FID': row.get("FID", idx),
            'persons': row["persons"],
            'grundflaec': row["grundflaec"],
            'E_Auto': row["E_Auto"],
            'WPumpe': row["WPumpe"],
            'geometry': row.get("geometry"),  # Die vollständige Geometrie wird mitgesendet
            'consumption_kWh': consumption
        }
        producer.send(TOPIC, value=data)
        print(f"Gesendet: {data}")
    producer.flush()
    current_time += timedelta(hours=1)
    time.sleep(100)
