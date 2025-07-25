from kafka import KafkaProducer
from functools import partial

producer = KafkaProducer(
    bootstrap_servers='dev.ak-8.kafka-4.ext-0:1047',
    max_request_size=20971520,  # 20 MB (bigger than broker's 10 MB)
)

# Define delivery success callback
def on_success(record_metadata):
    print(f"✅ Delivered to {record_metadata.topic} [partition {record_metadata.partition}] at offset {record_metadata.offset}")

# Define delivery error callback with message context
def on_error(excp, msg):
    print(f"❌ Delivery failed for message (first 20 bytes): {msg[:20]}... Error: {excp}")

messages = [
    b'x' * 100,           # small message, should succeed
    b'y' * 1024,          # small message, should succeed
    b'z' * 25_000_000,    # 25 MB, too large, should error
    b'w' * 30_000_000,    # 30 MB, too large, should error
]

for msg in messages:
    try:
        future = producer.send('test-topic', msg)
        future.add_callback(on_success)
        future.add_errback(partial(on_error, msg=msg))
        # Optionally block on each message to see immediate errors
        future.get(timeout=10)
    except Exception as e:
        print(f"❌ Failed to send message synchronously: {e}")
