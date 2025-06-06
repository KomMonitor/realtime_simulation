FROM python:3.9-slim

WORKDIR /app
COPY energyconsumption_bridge.py .
RUN pip install kafka-python paho-mqtt

CMD ["python", "energyconsumption_bridge.py"]
