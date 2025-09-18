#!/bin/bash
avro_flag=${1:-false}
source ~/av_openacr/ktest_kcat/hosts.sh



if [ "$avro_flag" = "false" ]; then
    echo "Producing records in json format"
    n=50
    for ((i=1; i<=n; i++)); do
        timestamp=$(date +"%Y-%m-%d %H:%M:%S")
        msg="Hello, Kafka!${i}"
        avro_msg="{\"msg\": \"$msg\", \"timestamp\": \"$timestamp\"}"  # Placeholder for Avro serialization
        echo "$avro_msg"
        echo "$avro_msg" | kcat -P -b $host:$port -t $topic -p 0
    done
    echo "produced $n json  messages to topic $topic"
    exit 0
else
    echo "Producing records in JSON format"
    source ~/av_openacr/venv/bin/activate
    python3 ~/av_openacr/pyth/avro_produce.py $host:$port $topic
    echo "produced $n avro   messages to topic $topic"
fi