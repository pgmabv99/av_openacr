# produce avro messages``
# pip install avro-python3 confluent-kafka[avro]
import sys
from confluent_kafka import avro
from confluent_kafka.avro import AvroProducer
from datetime import datetime
import time

# Avro schema
schema_str = """
{
  "type": "record",
  "name": "Message",
  "namespace": "com.example",
  "fields": [
    {"name": "msg", "type": "string"},
    {"name": "timestamp", "type": "string"}
  ]
}
"""

# Check command-line arguments
if len(sys.argv) < 3:
    print("Usage: python3 avro_create.py <host:port> <topic> [num_messages]")
    sys.exit(1)

# Parse arguments
broker = sys.argv[1]  # e.g., "localhost:9092"
topic = sys.argv[2]   # e.g., "my_topic"
n = int(sys.argv[3]) if len(sys.argv) > 3 else 50  # Default to 50 messages

# Kafka and Schema Registry configuration
config = {
    'bootstrap.servers': broker,
    'schema.registry.url': 'http://localhost:8081'  # Update with your Schema Registry URL
}

# Load Avro schema
value_schema = avro.loads(schema_str)

# Initialize AvroProducer
producer = AvroProducer(config, default_value_schema=value_schema)

# Produce messages
for i in range(1, n + 1):
    # Generate message and timestamp
    msg = f"Hello, Kafka!{i}"
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    # Create Avro message
    avro_msg = {
        "msg": msg,
        "timestamp": timestamp
    }
    
    # Produce message to Kafka
    producer.produce(topic=topic, value=avro_msg)
    print(f"Produced: {avro_msg}")
    
    # Optional: sleep to mimic original script
    # time.sleep(1)

# Flush producer to ensure all messages are sent
producer.flush()