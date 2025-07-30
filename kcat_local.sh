#!/bin/bash


for i in {1..3}; do

    # echo "Hello, Kafka! ${i}" | kcat -P -b localhost:9092 -t my-test-topic
    # kcat -b localhost:9092 -C -t my-test-topic -c 1

    echo "Hello, Kafka!${i} " | kcat -P -b 127.0.0.1:9092 -t my-test-topic
    # kcat -b 127.0.0.1:9092 -C -t my-test-topic -c 1
    kcat -b 127.0.0.1:9092 -C -t my-test-topic -o beginning -e
done