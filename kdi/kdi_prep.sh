#!/bin/bash
KAFKA_BROKERS=nj1-4.kafka-1.ext-0:1643
TOPIC=web_requests
FILE=tests/json/web_requests-100.json   
/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server $KAFKA_BROKERS --topic $TOPIC --delete --if-exists
/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server $KAFKA_BROKERS --topic $TOPIC --create --if-not-exists

echo "produce to topic $TOPIC from file $FILE"
/opt/kafka/current/bin/kafka-console-producer.sh --broker-list $KAFKA_BROKERS --topic $TOPIC < $FILE

echo "consume from topic $TOPIC and count records. offsets not committed, so can be re-run to get the same count"
kcat -b $KAFKA_BROKERS -t $TOPIC -C -o beginning -e | wc -l