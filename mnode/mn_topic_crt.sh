# #!/bin/bash
# #!/usr/bin/env bash
# set -u

# BROKER="localhost:54005"
# PREFIX="rdk_test"
# NUM_TOPICS=50       # N
# PARTITIONS=1
# REPLICATION=1

# KAFKA_TOPICS=/opt/kafka/current/bin/kafka-topics.sh

# echo "=== Deleting existing topics with prefix '${PREFIX}' (errors ignored) ==="

# $KAFKA_TOPICS \
#     --bootstrap-server "$BROKER" \
#     --list | grep "^${PREFIX}" | while read -r topic; do
#         echo "Deleting $topic"
#         $KAFKA_TOPICS \
#             --bootstrap-server "$BROKER" \
#             --delete \
#             --topic "$topic" \
#             >/dev/null 2>&1 || true
#     done

# # Kafka deletes are async
# sleep 3

# echo
# echo "=== Creating ${NUM_TOPICS} new topics (errors reported inline) ==="

# for i in $(seq 1 "$NUM_TOPICS"); do
#     topic="${PREFIX}${i}"
#     echo "Creating $topic"

#     $KAFKA_TOPICS \
#         --bootstrap-server "$BROKER" \
#         --create \
#         --topic "$topic" \
#         --partitions "$PARTITIONS" \
#         --replication-factor "$REPLICATION" \
#         || echo "ERROR creating topic: $topic" >&2
# done

# echo "Done."


#!/usr/bin/env bash
set -u

BROKER="localhost:54005"
PREFIX="rdk_test"
NUM_TOPICS=49      # N
PARTITIONS=1
REPLICATION=1

KAFKA_TOPICS=/opt/kafka/current/bin/kafka-topics.sh

echo "=== Deleting existing topics with prefix '${PREFIX}' (errors ignored) ==="

$KAFKA_TOPICS --bootstrap-server "$BROKER" --list | grep "^${PREFIX}" | while read -r topic; do
    echo "Deleting $topic"
    $KAFKA_TOPICS --bootstrap-server "$BROKER" --delete --topic "$topic" >/dev/null 2>&1 || true
done

# Optional short pause to let Kafka start deletion
sleep 2

echo
echo "=== Creating ${NUM_TOPICS} new topics in parallel (errors reported inline) ==="

for i in $(seq 0 "$NUM_TOPICS"); do
    topic="${PREFIX}${i}"
    echo "Creating $topic"
    
    # Run each create in background
    $KAFKA_TOPICS \
        --bootstrap-server "$BROKER" \
        --create \
        --topic "$topic" \
        --partitions "$PARTITIONS" \
        --replication-factor "$REPLICATION" \
        || echo "ERROR creating topic: $topic" >&2 &
done

# Wait for all background jobs to finish
wait

echo "Done."



