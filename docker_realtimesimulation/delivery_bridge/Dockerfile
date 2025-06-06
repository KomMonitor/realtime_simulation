FROM python:3.9-slim

WORKDIR /app
COPY delivery_bridge.py .
RUN pip install kafka-python paho-mqtt

CMD ["python", "delivery_bridge.py"]
