#!/bin/bash
set -x

/opt/kafka/bin/kafka-topics.sh --delete --topic test-topic --bootstrap-server localhost:9092
/opt/kafka/bin/kafka-topics.sh --create --topic test-topic --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1
/opt/kafka/bin/kafka-topics.sh --list --bootstrap-server localhost:9092

/opt/kafka/bin/kafka-topics.sh --delete --topic test-topic --bootstrap-server 192.168.110.11:9092
/opt/kafka/bin/kafka-topics.sh --create --topic test-topic --bootstrap-server 192.168.110.11:9092 --partitions 1 --replication-factor 1
/opt/kafka/bin/kafka-topics.sh --list --bootstrap-server 192.168.110.11:9092

/opt/kafka/bin/kafka-topics.sh --describe --topic test-topic --bootstrap-server 192.168.110.11:9092


# /opt/kafka/bin/kafka-console-consumer.sh --topic test-topic --bootstrap-server localhost:9092 --from-beginning