#!/bin/bash


echo "-------- kcat local to x2sup"
echo "Hello, Kafka!" | kcat -P -b localhost:9092 -t my-test-topic
kcat -b localhost:9092 -C -t my-test-topic