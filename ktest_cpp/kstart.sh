#!/bin/bash
set -x

# Stop Kafka Broker
/opt/kafka/bin/kafka-server-stop.sh
sleep 2
pkill -f kafka.Kafka  # Ensures Kafka is fully stoppe
# Stop Zookeeper
/opt/kafka/bin/zookeeper-server-stop.sh
sleep 2
pkill -f zookeeper


# Start Zookeeper
/opt/kafka/bin/zookeeper-server-start.sh   /opt/kafka/config/zookeeper.properties &
# Start Kafka Broker
/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties &