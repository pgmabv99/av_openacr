#!/usr/bin/env bash
#
# Simple Kafka producer performance test against localhost:54005
# Adjust values below as needed
#

set -u   # exit on undefined variables

# === Configuration ========================================

BROKER="localhost:54005"
# BROKER="nj1-4.x2-3.ext-0:1519"
# BROKER="nj1-4.kafka-1.ext-0:1643"
TOPIC="perf-test-topic"
# NUM_RECORDS=1000000          # 1 million messages
NUM_RECORDS=100       # 1 million messages
RECORD_SIZE=100              # bytes per message (~ realistic small payload)
THROUGHPUT=-1                # -1 = no limit → as fast as possible

# Common good settings for decent throughput + reasonable latency
PRODUCER_PROPS=(
  "acks=1"                   # fastest; use "all" if you want stronger durability
  "compression.type=lz4"     # good compression/performance balance
  "batch.size=327680"        # 320 KiB – helps a lot
  "linger.ms=5"              # small delay → lower latency, still good batching
  "buffer.memory=134217728"  # 128 MiB send buffer
)

# === Script body ==========================================

echo "Starting Kafka producer performance test..."
echo "  Broker     : ${BROKER}"
echo "  Topic      : ${TOPIC}"
echo "  Messages   : ${NUM_RECORDS}"
echo "  Record size: ${RECORD_SIZE} bytes"
echo ""

# Make sure the topic exists (optional – many clusters allow auto-create)
# kafka-topics.sh --bootstrap-server "${BROKER}" --create --topic "${TOPIC}" --partitions 6 --replication-factor 1 2>/dev/null || true

kafka-producer-perf-test.sh \
  --topic "${TOPIC}" \
  --num-records ${NUM_RECORDS} \
  --record-size ${RECORD_SIZE} \
  --throughput ${THROUGHPUT} \
  --producer-props \
    bootstrap.servers="${BROKER}" \
    "${PRODUCER_PROPS[@]}"

echo ""
echo "Done."

#   --reporting-interval 1000 \