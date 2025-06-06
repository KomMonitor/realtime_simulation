FROM python:3.9-slim

WORKDIR /app
COPY mobility_bridge.py .
RUN pip install kafka-python paho-mqtt

CMD ["python", "mobility_bridge.py"]
