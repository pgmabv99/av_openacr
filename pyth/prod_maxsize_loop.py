from kafka import KafkaProducer
from functools import partial

producer = KafkaProducer(
    bootstrap_servers='dev.ak-8.kafka-4.ext-0:1047',
    max_request_size=20971520,  # 20 MB (bigger than broker's 10 MB)
    # acks='1',   # No acknowledgment needed for this test
)

# Define delivery success callback
def on_success(record_metadata,msg):
    print(f"✅ msg:{msg[:20]}... topic:{record_metadata.topic} partition:{record_metadata.partition} offset:{record_metadata.offset}")

# Define delivery error callback with message context
def on_error(excp, msg):
    print(f"❌ msg:{msg[:20]}... Error:{excp}")


messages = [
    b'z' * 19_000_000,    # 19 MB, > remote limit and < local limit, should error remotely
    b'x' * 100,           # small message, should succeed
    b'y' * 1024,          # small message, should succeed
    b'w' * 30_000_000,    # 30 MB, > local limit    , should error locally
]

# for msg in messages:
#     try:
#         future = producer.send('test-topic', msg)
#         future.add_callback(partial(on_success, msg=msg))
#         future.add_errback(partial(on_error, msg=msg))
#         # Optionally block on each message to see immediate errors
#         future.get(timeout=10)
#     except Exception as e:
#         print(f"❌ Failed to send message synchronously: {e}")


for msg in messages:
    future = producer.send('test-topic', msg)
    future.add_callback(partial(on_success, msg=msg))
    future.add_errback(partial(on_error, msg=msg))
    # Optionally block on each message to see immediate errors


# (In a real app, you'd keep running or flush before exit)
producer.flush()