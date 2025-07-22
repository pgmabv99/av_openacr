#!/bin/bash


for i in {1..10}; do

    echo "Hello, Kafka!" | kcat -P -b localhost:9092 -t my-test-topic
    kcat -b localhost:9092 -C -t my-test-topic -c 1

    # echo "Hello, Kafka!" | kcat -P -b 127.0.0.1:9092 -t my-test-topic
    # kcat -b 127.0.0.1:9092 -C -t my-test-topic -c 1
done