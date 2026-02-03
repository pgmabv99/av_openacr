#!/usr/bin/env bash
set -euo pipefail

BROKER="${1:-localhost:54005}"
NUM_TOPICS="${2:-10}"
PREFIX="test-topic"
PARTITIONS=3
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
