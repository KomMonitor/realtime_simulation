FROM python:3.9-slim

WORKDIR /app

# Kopiere die Abhängigkeitsliste und installiere diese
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kopiere den Anwendungscode
COPY app.py .
# Kopiere den Ordner mit statischen Dateien (z.B. index.html, JS, CSS)
COPY static/ ./static/

EXPOSE 80
CMD ["python", "app.py"]
