#!/usr/bin/env bash
#
# Simple Kafka producer performance test against localhost:54005
# Adjust values below as needed
#

set -u   # exit on undefined variables
source mn_set.sh
# === Configuration ========================================

# # BROKER="localhost:54005"
# broker="nj1-4.x2-3.ext-0:1519"
# broker="nj1-4.kafka-1.ext-0:1643"
TOPIC="perf-test-topic"
# NUM_RECORDS=1000000          # 1 million messages
NUM_RECORDS=100000       # 1 million messages
NUM_RECORDS=10000        # 1 million messages
NUM_RECORDS=10000        # 1 million messages
# NUM_RECORDS=100       # 1 million messages
RECORD_SIZE=1000           # bytes per message (~ realistic small payload)
# RECORD_SIZE=10           # bytes per message (~ realistic small payload)
THROUGHPUT=-1                # -1 = no limit → as fast as possible




# Common good settings for decent throughput + reasonable latency
PRODUCER_PROPS=(
  # "acks=1"                   # fastest; use "all" if you want stronger durability
  # "acks=all"                   # 
  "batch.size=327680"        # 320 KiB – helps a lot
  "linger.ms=5"              # small delay → lower latency, still good batching
  "buffer.memory=134217728"  # 128 MiB send buffer
)
#   "compression.type=lz4"     # good compression/performance balance

# create topic


# === Script body ==========================================

echo "Starting Kafka producer performance test..."
echo "  broker     : ${broker}"
echo "  Topic      : ${TOPIC}"
echo "  Messages   : ${NUM_RECORDS}"
echo "  Record size: ${RECORD_SIZE} bytes"
echo ""

# Make sure the topic exists (optional – many clusters allow auto-create)
/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server "${broker}" --create --topic "${TOPIC}" --partitions 3 --replication-factor 1 2>/dev/null || true

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

#   --reporting-interval 1000 \