#!/bin/bash
echo "produce records"
source ~/av_openacr/ktest_kcat/hosts.sh

# source ~/av_openacr/venv/bin/activate
# python3 ~/av_openacr/ktest_python/top_recreate.py $host:$port $topic

source ~/av_openacr/ktest_kcat/hosts.sh
for i in {0..50}; do
    # sleep 1
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    msg="Hello, Kafka!${i} [$timestamp]"
    echo "$msg"
    echo "$msg" | kcat -P -b $host:$port -t $topic
done
