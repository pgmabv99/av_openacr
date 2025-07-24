from kafka import KafkaProducer
import logging

# Enable logging to see errors
# logging.basicConfig(level=logging.DEBUG)

producer = KafkaProducer(
    bootstrap_servers='dev.ak-8.kafka-4.ext-0:1047',
    max_request_size=20971520,  # 20 MB (bigger than broker's 10 MB)
)

# Create a message that's 1.5 MB
msg = b'x' * 15728640  # 1.5 * 1024 * 1024 * 10
# msg = b'x' * 10

# Define delivery success callback
def on_success(record_metadata):
    print(f"✅ Delivered to {record_metadata.topic} [partition {record_metadata.partition}] at offset {record_metadata.offset}")

# Define delivery error callback
def on_error(excp):
    print(f"❌ Delivery failed: {excp}")

try:
    # Send message with delivery callbacks
    future = producer.send('test-topic', msg)
    future.add_callback(on_success)
    future.add_errback(on_error)

    # Optionally block until the message is sent (for error propagation)
    result = future.get(timeout=10)

except Exception as e:
    print(f"❌ Failed to send message: {e}")