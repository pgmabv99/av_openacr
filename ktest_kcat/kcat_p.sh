#!/bin/bash
source ~/av_openacr/ktest_kcat/hosts.sh

# source ~/av_openacr/venv/bin/activate
# python3 ~/av_openacr/ktest_python/top_recreate.py $host:$port $topic

source ~/av_openacr/ktest_kcat/hosts.sh
echo "produce records"
for i in {0..777}; do
    # sleep 1
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    msg="Hello, Kafka!${i} [$timestamp]"
    echo "$msg"
    echo "$msg" | kcat -P -b $host:$port -t $topic
done
