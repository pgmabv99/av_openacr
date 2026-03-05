#!/usr/bin/env bash
#
set -u  # Exit if an undefined variable is used
bootstrap_servers=nj1-4.kafka-1.ext-0:1643,nj1-4.kafka-2.ext-0:1650,nj1-4.kafka-3.ext-0:1657,nj1-4.kafka-4.ext-0:1664
# bootstrap_servers=localhost:54005

#worker
listeners=http://localhost:1683
worker_host=localhost
worker_port=1683
kafka_connect_work_dir=temp/kafka_connect
kafka_bin_dir=/opt/kafka/current/bin
topic=test-topic0

function copy_connector_properties {

mkdir -p $kafka_connect_work_dir

cat << EOF >$kafka_connect_work_dir/worker.properties
bootstrap.servers=${bootstrap_servers}
config.storage.replication.factor=1
config.storage.topic=connect-storage-kafkacw-1-configs
config.storage.topic.creation.enable=false
group.id=kafkacw-1
listeners=$listeners
offset.flush.interval.ms=10000
offset.storage.replication.factor=3
offset.storage.topic=connect-storage-kafkacw-1-offsets
offset.storage.topic.creation.enable=false
plugin.path=/opt/kafka/current/libs
rest.advertised.host.name=$worker_host
rest.advertised.port=$worker_port
status.storage.replication.factor=1
status.storage.topic=connect-storage-kafkacw-1-status
status.storage.topic.creation.enable=false
key.converter=org.apache.kafka.connect.storage.StringConverter
value.converter=org.apache.kafka.connect.storage.StringConverter
EOF

cat << EOF >$kafka_connect_work_dir/connector.json
{
  "name": "test",
  "config": {
    "connector.class": "org.apache.kafka.connect.file.FileStreamSinkConnector",
    "tasks.max": "1",
    "topics": "$topic",
    "file": "$kafka_connect_work_dir/output",
    "flush.size": "1"
  }
}
EOF
}


#-------
function worker_start {
    echo "Creating required topics for Kafka Connect..."
    $kafka_bin_dir/kafka-topics.sh --bootstrap-server $bootstrap_servers  --create  --if-not-exists --topic connect-storage-kafkacw-1-offsets  --partitions 25  --replication-factor 3  --config cleanup.policy=compact  --config min.compaction.lag.ms=60000  --config segment.bytes=1073741824
    $kafka_bin_dir/kafka-topics.sh --bootstrap-server $bootstrap_servers  --create  --if-not-exists --topic connect-storage-kafkacw-1-configs --partitions 1 --replication-factor 3 --config cleanup.policy=compact --config min.compaction.lag.ms=60000
    $kafka_bin_dir/kafka-topics.sh --bootstrap-server $bootstrap_servers  --create  --if-not-exists --topic connect-storage-kafkacw-1-status --partitions 5 --replication-factor 3 --config cleanup.policy=compact --config min.compaction.lag.ms=60000
    export KAFKA_HEAP_OPTS="-Xms16G -Xmx16G"
    set -x
    while :; do
        echo "Starting Kafka Connect worker... logs will be in /opt/kafka/current/logs/connect.log"
        $kafka_bin_dir/connect-distributed.sh -daemon $kafka_connect_work_dir/worker.properties
        # Wait up to 30 seconds for port to become available
        timeout 30 bash -c "until lsof -i :$worker_port >/dev/null 2>&1; do sleep 1; done"
        if [ $? -eq 0 ]; then
            echo "Connection established on port $worker_port"
            break
        fi
        pkill -f connect-distributed
        echo "Retrying in 5 seconds..."
        sleep 5
    done
}
#-------
function worker_stop {
    echo "Stopping Kafka Connect worker... via kill "
    kill -9 $(pidof java) 1>/dev/null 2>/dev/null || { echo "====Was not running"; }
}
#-------
function worker_status {
    echo "Checking status of worker on port $worker_port..."
    lsof -P -i :$worker_port && curl -sS http://$worker_host:$worker_port/connectors | jq
}
#-------
function connector_start {
    #echo "posting connector json after 5 sec sleep"
    #sleep 5
    curl -sS -X POST -H "Content-Type: application/json" --data @$kafka_connect_work_dir/connector.json  http://$worker_host:$worker_port/connectors | jq
    echo "List of connectors after posting new connector:"
    curl -sS  http://$worker_host:$worker_port/connectors | jq
}

#-------
function connector_list_delete {
    echo "get connectors list"
    connector_list=$(curl -sS -X GET http://$worker_host:$worker_port/connectors | jq -r '.[]')
    # Iterate over each connector
    for connector in $connector_list; do
        echo "pause and delete connector $connector..."
        curl -sS -X PUT http://$worker_host:$worker_port/connectors/$connector/pause
        curl -sS -X DELETE http://$worker_host:$worker_port/connectors/$connector
    done
}


#-------
copy_connector_properties
# Validate input argument
if [ $# -eq 0 ] || [[ ! " start_clean stop status " =~ " $1 " ]]; then
    echo "Usage: $0 {start_clean|stop|status}"
    exit 1
fi

case $1 in
    start_clean)
        rm  $kafka_connect_work_dir/output || true
        worker_stop
        worker_start
        connector_list_delete
        connector_start
    ;;
    stop)
         worker_stop
         cat $kafka_connect_work_dir/output
    ;;
    status)
        worker_status
    ;;
    *)
    ;;
esac
