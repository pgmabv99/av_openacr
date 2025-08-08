#!/bin/bash
set -x
host=dev.x2-4.kafka-1.ext-0
port=1643
topic=my-test-topic

# echo "from beginning "
# kcat -b $host:$port -C -t $topic -o beginning -e
# echo "from number "
# kcat -b $host:$port -C -t $topic -p 0 -o 4  -e
echo "consumer groups "
kcat -b $host:$port  -G my-group -t $topic -p 0 -c 1 -X auto.commit.interval.ms=100 -e   