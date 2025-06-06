FROM python:3.9-slim

WORKDIR /app
COPY energyconsumption_consumer.py .
RUN pip install kafka-python flask

CMD ["python", "energyconsumption_consumer.py"]
