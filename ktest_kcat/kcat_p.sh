#!/bin/bash
# set -x
host=dev.x2-4.kafka-1.ext-0
port=1643
topic=my-test-topic

# python3 ~/av_openacr/ktest_python/top_recreate.py $host:$port $topic

echo "produce records"
for i in {0..3000}; do
    sleep 1
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    msg="Hello, Kafka!${i} [$timestamp]"
    echo "$msg"
    echo "$msg" | kcat -P -b $host:$port -t $topic
done
