#!/usr/bin/env bash
set -euo pipefail

BROKER="nj1-4.x2-3.ext-0:1519"
PREFIX="test_topic"
NUM_TOPICS=10
PARTITIONS=20
REPLICATION=1

KAFKA_TOPICS=/opt/kafka/current/bin/kafka-topics.sh

echo "=== Creating ${NUM_TOPICS} topics ==="

for i in $(seq 0 $((NUM_TOPICS-1))); do
    topic="${PREFIX}${i}"
    echo "Creating $topic"
    $KAFKA_TOPICS \
        --bootstrap-server "$BROKER" \
        --create \
        --topic "$topic" \
        --partitions "$PARTITIONS" \
        --replication-factor "$REPLICATION"
done

echo
echo "=== Verifying topics ==="

for i in $(seq 0 $((NUM_TOPICS-1))); do
    $KAFKA_TOPICS \
        --bootstrap-server "$BROKER" \
        --describe \
        --topic "${PREFIX}${i}"
done

echo "Done."
