#!/usr/bin/env bash
set -u

BROKER="localhost:54005"
PREFIX="rdk_test"
NUM_TOPICS=10
CLIENT_ID="atf_rdk"

KCAT=kcat   # or kafkacat

topics=()
for i in $(seq 0 $((NUM_TOPICS-1))); do
    topics+=("-t" "${PREFIX}${i}")
done

set -x
$KCAT \
    -b "$BROKER" \
    -L \
    -X client.id="$CLIENT_ID" \
    "${topics[@]}"

exit

/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server localhost:54005 --describe --topic rdk_test0,rdk_test1

/opt/kafka/current/bin/kafka-console-consumer.sh --bootstrap-server localhost:54005 \
  --topic rdk_test0 --topic rdk_test1 \
  --timeout-ms 1000 --max-messages 0
