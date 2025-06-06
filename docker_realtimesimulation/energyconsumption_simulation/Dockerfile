FROM python:3.9-slim

WORKDIR /app
COPY energyconsumption_simulation.py .
COPY prepared_gebaeude_layer.geojson .
RUN pip install kafka-python numpy pandas

CMD ["python", "energyconsumption_simulation.py"]
