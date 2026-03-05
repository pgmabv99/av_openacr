#!/usr/bin/env bash
#
# Simple Kafka producer performance test against localhost:54005
# Adjust values below as needed
#

set -u   # exit on undefined variables
source mn_set.sh

# === Configuration ========================================

TOPIC="test-topic"
# NUM_RECORDS=1000000          # 1 million messages
NUM_RECORDS=100000       # 1 million messages
NUM_RECORDS=10000        # 1 million messages
NUM_RECORDS=10000        # 1 million messages
# NUM_RECORDS=100       # 1 million messages
RECORD_SIZE=1000           # bytes per message (~ realistic small payload)
# RECORD_SIZE=10           # bytes per message (~ realistic small payload)
THROUGHPUT=-1                # -1 = no limit → as fast as possible

PRODUCER_PROPS=(
  # "acks=1"                   # fastest; use "all" if you want stronger durability
  # "acks=all"                   # 
  "batch.size=327680"        # 320 KiB – helps a lot
  "linger.ms=5"              # small delay → lower latency, still good batching
  "buffer.memory=134217728"  # 128 MiB send buffer
)
#   "compression.type=lz4"     # good compression/performance balance


echo "Starting Kafka producer performance test..."
echo "  broker     : ${broker}"
echo "  Topic      : ${TOPIC}"
echo "  Messages   : ${NUM_RECORDS}"
echo "  Record size: ${RECORD_SIZE} bytes"
echo ""

echo "Creating topic ${TOPIC} if it doesn't exist..."
/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server "${broker}" --create --topic "${TOPIC}" --partitions 3 --replication-factor 1 2>/dev/null || true

echo "Running producer performance test..."
/opt/kafka/current/bin/kafka-producer-perf-test.sh \
  --topic "${TOPIC}" \
  --num-records ${NUM_RECORDS} \
  --record-size ${RECORD_SIZE} \
  --throughput ${THROUGHPUT} \
  --producer-props \
    bootstrap.servers="${broker}" \
    "${PRODUCER_PROPS[@]}"

echo ""
echo "Done."