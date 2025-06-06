FROM python:3.9-slim

WORKDIR /app
COPY delivery_simulation.py .
COPY Homepoint.geojson .
COPY Streetnetwork.geojson .
RUN pip install kafka-python networkx

CMD ["python", "delivery_simulation.py"]
