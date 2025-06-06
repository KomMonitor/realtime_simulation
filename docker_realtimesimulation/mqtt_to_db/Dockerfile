FROM python:3.9-slim

WORKDIR /app

# Installiere Python-Abhängigkeiten
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kopiere den Anwendungscode
COPY mqtt_to_db.py .

CMD ["python", "mqtt_to_db.py"]
