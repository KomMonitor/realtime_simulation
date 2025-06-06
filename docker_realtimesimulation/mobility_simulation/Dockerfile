FROM python:3.9-slim

WORKDIR /app
COPY mobility_simulation.py .
RUN pip install kafka-python
RUN pip install numpy

CMD ["python", "mobility_simulation.py"]
