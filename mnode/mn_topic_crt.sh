#!/usr/bin/env bash
set -euo pipefail

BROKER="${1:-localhost:54005}"
NUM_TOPICS="${2:-10}"
PREFIX="test-topic"
PARTITIONS=3
REPLICATION=1

KAFKA_TOPICS=/opt/kafka/current/bin/kafka-topics.sh

echo "=== Creating ${NUM_TOPICS} topics in parallel ==="

# Launch all create commands in background
for i in $(seq 0 $((NUM_TOPICS-1))); do
    topic="${PREFIX}${i}"
        echo "Submitting creation of $topic ..."
    $KAFKA_TOPICS \
        --bootstrap-server "$BROKER" \
        --create \
        --topic "$topic" \
        --partitions "$PARTITIONS" \
        --replication-factor "$REPLICATION" \
     &
done

echo "→ All create commands started. Waiting for completion..."
wait

echo "All creations finished."
echo

# You can keep verification sequential (usually fast)
echo "=== Verifying topics ==="

created=$($KAFKA_TOPICS --bootstrap-server "$BROKER" --list 2>/dev/null | grep -c "^${PREFIX}[0-9]\+$")
echo "Created: $created / $NUM_TOPICS"

echo "Done."