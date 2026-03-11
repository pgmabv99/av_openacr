#!/usr/bin/env bash

#  test kafka connector with aiven sink   connector to see if we can reproduce rebalance bug

# Exit on error, show actual error messages, and print commands being executed
set -euo pipefail
trap 'echo "Error on line $LINENO: $?" >&2' ERR

# Validate input argument
if [ $# -eq 0 ] || [[ ! " start stop " =~ " $1 " ]]; then
    echo "Usage: $0 {start|stop} [bootstrap_servers] [topic]"
    echo "start - start the Kafka Connect worker and  connector"
    echo "stop  - stop the Kafka Connect worker and grep log for err and list minio obejcts"
    echo "typical sequence:"
    echo "  // change S3 endpoint to use yyour minio node"
    echo "  // start kafka or x2 broker"
    echo "  // produce some messages to the test-topic0 topic  "
    echo "  $0 start localhost:54005 test-topic0"
    echo "  sleep some time for connector to do some work"
    echo "  $0 stop  // see the output file contents"
    exit 1
fi
action=$1

bootstrap_servers="${2:-nj1-4.kafka-1.ext-0:1643,nj1-4.kafka-2.ext-0:1650,nj1-4.kafka-3.ext-0:1657,nj1-4.kafka-4.ext-0:1664}"
# bootstrap_servers="${2:-localhost:54005}"
topic="${3:-test-topic0}"

#worker
listeners=http://localhost:1683
worker_host=localhost
worker_port=1683
kafka_connect_work_dir=temp/kafka_connect
kafka_bin_dir=/opt/kafka/current/bin

#connector
bucket_name="test-bucket-kafkacw-1"
s3_endpoint="http://nj1-4.minio-1.ext-0:1673"

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
plugin.path=/opt/kafka/plugins
rest.advertised.host.name=$worker_host
rest.advertised.port=$worker_port
status.storage.replication.factor=1
status.storage.topic=connect-storage-kafkacw-1-status
status.storage.topic.creation.enable=false
key.converter=org.apache.kafka.connect.storage.StringConverter
value.converter=org.apache.kafka.connect.storage.StringConverter
EOF
# plugin.path=/opt/kafka/current/libs


cat << EOF >$kafka_connect_work_dir/connector.json
{
  "name": "test_connector",
  "config": {
    "aws.access.key.id": "minioadmin",
    "aws.s3.bucket.name": "$bucket_name",
    "aws.s3.endpoint": "$s3_endpoint",
    "aws.s3.path.style.access": "true",
    "aws.s3.region": "us-east-1",
    "aws.secret.access.key": "minioadmin",
    "connector.class": "io.aiven.kafka.connect.s3.AivenKafkaConnectS3SinkConnector",
    "consumer.override.auto.offset.reset": "earliest",
    "consumer.override.enable.auto.commit": "false",
    "errors.log.enable": "true",
    "file.compression.type": "none",
    "file.name.template": "{{topic}}-{{partition:padding=true}}-{{start_offset:padding=true}}",
    "format.class": "io.aiven.kafka.connect.s3.format.json.JsonFormat",
    "format.output.fields": "key,offset,timestamp,value,headers",
    "format.output.type": "jsonl",
    "key.converter": "org.apache.kafka.connect.converters.ByteArrayConverter",
    "tasks.max": "3",
    "topics.regex": "$topic",
    "value.converter": "org.apache.kafka.connect.converters.ByteArrayConverter",
    "flush.size": "1",
    "rotate.interval.ms": "1000"
  }
}
EOF
# "topics.regex": "^(?i)(?!(__.*|_schemas|connect-.*|public..*)$).*",

# cat << EOF >$kafka_connect_work_dir/connector.json
# {
#   "name": "test_connector",
#   "config": {
#     "connector.class": "org.apache.kafka.connect.file.FileStreamSinkConnector",
#     "tasks.max": "1",
#     "topics": "$topic",
#     "file": "$kafka_connect_work_dir/output",
#     "flush.size": "1"
#   }
# }
# EOF


}

function init_mc {
    mc alias set minio-1 $s3_endpoint minioadmin minioadmin --api S3v4 --path auto
}

function bucket_recreate {
    echo "remove and create bucket minio-1/$bucket_name"
    mc stat minio-1/$bucket_name &>/dev/null && mc rb --force minio-1/$bucket_name; mc mb minio-1/$bucket_name
}

function bucket_list {
    echo "===dumping list of objects in bucket $bucket_name at s3 endpoint $s3_endpoint via minio"
    mc alias set minio-1 $s3_endpoint minioadmin minioadmin
    mc ls minio-1/$bucket_name
    echo "===count number of lines"
    mc find minio-1/$bucket_name \
        | xargs -I {} mc cat {} \
        | wc -l
}
#-------
function worker_start {
    echo "Creating required topics for Kafka Connect..."
    $kafka_bin_dir/kafka-topics.sh --bootstrap-server $bootstrap_servers  --create  --if-not-exists --topic connect-storage-kafkacw-1-offsets  --partitions 25  --replication-factor 3  --config cleanup.policy=compact  --config min.compaction.lag.ms=60000  --config segment.bytes=1073741824
    $kafka_bin_dir/kafka-topics.sh --bootstrap-server $bootstrap_servers  --create  --if-not-exists --topic connect-storage-kafkacw-1-configs --partitions 1 --replication-factor 3 --config cleanup.policy=compact --config min.compaction.lag.ms=60000
    $kafka_bin_dir/kafka-topics.sh --bootstrap-server $bootstrap_servers  --create  --if-not-exists --topic connect-storage-kafkacw-1-status --partitions 5 --replication-factor 3 --config cleanup.policy=compact --config min.compaction.lag.ms=60000
    export KAFKA_HEAP_OPTS="-Xms16G -Xmx16G"
    while :; do
        echo "Starting Kafka Connect worker... logs will be in /opt/kafka/current/logs/connect.log"
        $kafka_bin_dir/connect-distributed.sh -daemon $kafka_connect_work_dir/worker.properties
        # Wait up to 30 seconds for port to become available
        timeout 30 bash -c "until lsof -i :$worker_port >/dev/null 2>&1; do sleep 1; done"
        if [ $? -eq 0 ]; then
            echo "Connection to worker established on port $worker_port"
            break
        fi
        pkill -f connect-distributed
        echo "Retrying in 5 seconds..."
        sleep 5
    done
}
#-------
function worker_stop {

    if pgrep -x java > /dev/null; then
        connector_list_delete
    fi
    echo "Stopping Kafka Connect worker... via TERM "
    kill -15 $(pidof java) 1>/dev/null 2>/dev/null || { echo "====Was not running"; }
    sleep 2
    if pgrep -x java > /dev/null; then
        echo "Process still running, force via KILL..."
        kill -9 $(pidof java) 1>/dev/null 2>/dev/null || true
    fi
}
#-------
function worker_status {
    echo "Checking status of worker on port $worker_port..."
    lsof -P -i :$worker_port && curl -sS http://$worker_host:$worker_port/connectors | jq
}
#-------
function connector_start {
    echo "Posting connector json "
    #sleep 5
    curl -sS -X POST -H "Content-Type: application/json" --data @$kafka_connect_work_dir/connector.json  http://$worker_host:$worker_port/connectors | jq
    echo "List of connectors after posting new connector:"
    curl -sS  http://$worker_host:$worker_port/connectors | jq
    echo
}

#-------
function connector_list_delete {
    echo "Getting connectors list"
    curl -sS -X GET http://$worker_host:$worker_port/connectors
    connector_list=$(curl -sS -X GET http://$worker_host:$worker_port/connectors | jq -r '.[]')
    # Iterate over each connector
    for connector in $connector_list; do
        echo
        echo "Pausing  : $connector"
        curl -sS -X PUT http://$worker_host:$worker_port/connectors/$connector/pause
        sleep 2
        echo
        echo "Deleting : $connector"
        curl -sS -X DELETE http://$worker_host:$worker_port/connectors/$connector
        echo
        echo "Paused and deleted connector : $connector"
    done
    echo
}


#-------
copy_connector_properties

case $action in
    start)
        # echo "local cleanup"
        # [ -f "$kafka_connect_work_dir/output" ] && rm "$kafka_connect_work_dir/output"
        # echo "current files in $kafka_connect_work_dir:"
        # ls -l $kafka_connect_work_dir

        bucket_recreate

        echo "Cleaning up local Kafka Connect logs in /opt/kafka/current/logs/"
        sudo rm -rf /opt/kafka/current/logs/*

        worker_stop
        worker_start
        connector_list_delete
        connector_start
        echo "===KafkaConnect_started"
    ;;
    stop)
        echo "===Stopping Kafka Connect worker and connector..."
         worker_stop

        #  echo "Dumping $kafka_connect_work_dir/output"
        #  cat $kafka_connect_work_dir/output
        #  echo "number of lines in output file:"
        #  wc -l $kafka_connect_work_dir/output

        echo "KafkaConnect_stopped"
        bucket_list
        echo '===GREP FOR errors in Kafka Connect logs:'
        grep ERR /opt/kafka/current/logs/connect.log || true
        echo '===GREP FOR Processing in Kafka Connect logs:'
        grep Processing /opt/kafka/current/logs/connect.log || true

    ;;
    status)
        worker_status
    ;;
esac
