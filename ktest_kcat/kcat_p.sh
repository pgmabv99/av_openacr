#!/bin/bash
set -x
host=dev.x2-4.kafka-1.ext-0
port=1643
topic=my-test-topic
echo "topic delete $topic"
python3 ~/av_openacr/ktest_python/top_del.py $host:$port $topic

echo "produce records"
for i in {0..5}; do
    #  use same key
    # echo "key1:Hello, Kafka!${i} " | kcat -P -b $host:$port -t $topic -K:
    # use partition 0
    echo "Hello, Kafka!${i} " | kcat -P -b $host:$port -t $topic -p 0
done