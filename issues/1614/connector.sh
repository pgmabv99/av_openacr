#!/usr/bin/env bash
#
set -u  # Exit if an undefined variable is used
bootstrap_servers=nj1-4.kafka-1.ext-0:1643,nj1-4.kafka-2.ext-0:1650,nj1-4.kafka-3.ext-0:1657,nj1-4.kafka-4.ext-0:1664
listeners=http://nj1-4.kafkacw-1.ctrl-0:1683
worker_host=nj1-4.kafkacw-1.ctrl-0
rest_advertised_port=1683

#worker
listeners=http://localhost:1683
worker_host=localhost
worker_port=1683
# rest catalog
catalog_port=1690

kafka_dir=/opt/kafka/current/bin

function copy_connector_properties {

cat << EOF >worker.properties
bootstrap.servers=${bootstrap_servers}
config.storage.replication.factor=1
config.storage.topic=connect-storage-kafkacw-1-configs
config.storage.topic.creation.enable=false
group.id=nj1-4.kafkacw-1
key.converter=org.apache.kafka.connect.converters.ByteArrayConverter
listeners=$listeners
offset.flush.interval.ms=10000
offset.storage.replication.factor=3
offset.storage.topic=connect-storage-kafkacw-1-offsets
offset.storage.topic.creation.enable=false
plugin.path=/home/kafkausr/kafka/plugins
rest.advertised.host.name=$worker_host
rest.advertised.port=$worker_port
status.storage.replication.factor=1
status.storage.topic=connect-storage-kafkacw-1-status
status.storage.topic.creation.enable=false
value.converter=org.apache.kafka.connect.converters.ByteArrayConverter
EOF

cat << EOF >connector.json
{
  "name": "test"
  "config": {
    "aws.access.key.id": "minioadmin",
    "aws.s3.bucket.name": "bucket-nj1-4.kafkacw-1",
    "aws.s3.endpoint": "http://nj1-4.minio-1.ext-0:1673",
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
    "topics.regex": "^(?i)(?!(__.*|_schemas|connect-.*|public..*)$).*",
    "value.converter": "org.apache.kafka.connect.converters.ByteArrayConverter"
  }
}
EOF
}
export CONNECTOR_DIRECTION="sink"
#-------
function bucket_recreate {
    echo "remove and create bucket minio-1/bucket-nj1-4.kafkacw-1"
    mc stat minio-1/bucket-nj1-4.kafkacw-1 &>/dev/null && mc rb --force minio-1/bucket-nj1-4.kafkacw-1; mc mb minio-1/bucket-nj1-4.kafkacw-1
}

#-------todo remove loop. only one exists
function delete_existing_connectors {

    # Get the list of connectors
    connector_list=$(curl -sS -X GET http://$worker_host:$worker_port/connectors | jq -r '.[]')
    # Iterate over each connector
    for connector in $connector_list; do
        echo "Processing connector: $connector"
        # pause and delete the connector
        echo "Deleting connector $connector..."
        curl -sS -X PUT http://$worker_host:$worker_port/connectors/$connector/pause
        curl -sS -X DELETE http://$worker_host:$worker_port/connectors/$connector

    done
}

#-------
function start_worker {
    echo "Creating required topics for Kafka Connect..."
    $kafka_dir/kafka-topics.sh --bootstrap-server $bootstrap_servers   --create  --topic connect-storage-kafkacw-1-offsets  --partitions 25  --replication-factor 3  --config cleanup.policy=compact  --config min.compaction.lag.ms=60000  --config segment.bytes=1073741824
    $kafka_dir/kafka-topics.sh --bootstrap-server $bootstrap_servers  --create   --topic connect-storage-kafkacw-1-configs --partitions 1 --replication-factor 3 --config cleanup.policy=compact --config min.compaction.lag.ms=60000
    $kafka_dir/kafka-topics.sh --bootstrap-server $bootstrap_servers  --create  --topic connect-storage-kafkacw-1-status --partitions 5 --replication-factor 3 --config cleanup.policy=compact --config min.compaction.lag.ms=60000
    export KAFKA_HEAP_OPTS="-Xms16G -Xmx16G"
    set -x
    while :; do
        echo "Starting Kafka Connect worker..."
        ls -ltr worker.properties
        $kafka_dir/connect-distributed.sh -daemon worker.properties
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
function start_new_connector {
    delete_existing_connectors
    #echo "posting connector json after 5 sec sleep"
    #sleep 5
    curl -sS -X POST -H "Content-Type: application/json" --data @connector.json  http://$worker_host:$worker_port/connectors | jq
    echo "List of connectors after posting new connector:"
    curl -sS  http://$worker_host:$worker_port/connectors | jq
}
#-------
function restart_iceberg_rest_catalog {
    echo "Restart iceberg rest catalog..."
    export AWS_ACCESS_KEY_ID=minioadmin
    export AWS_SECRET_ACCESS_KEY=minioadmin
    export AWS_REGION=us-east-1
    export CATALOG_WAREHOUSE=s3://bucket-nj1-4.kafkacw-1
    export CATALOG_IO__IMPL=org.apache.iceberg.aws.s3.S3FileIO
    export CATALOG_S3_ENDPOINT=http://nj1-4.minio-1.ext-0:1673
    export CATALOG_S3_PATH__STYLE__ACCESS=true
    export CATALOG_CATALOG__IMPL=org.apache.iceberg.jdbc.JdbcCatalog
    export CATALOG_URI=jdbc:sqlite:/tmp/iceberg_catalog.db
    export CATALOG_JDBC_USER=user
    export CATALOG_JDBC_PASSWORD=password
    export CATALOG_JDBC_STRICT__MODE=true
    export catalog_port=$catalog_port

    echo "kill current rest server"
    pkill -f 'iceberg-open-api-test-fixtures-runtime'

    echo "remove old jdbc db"
    rm -f /tmp/iceberg_catalog.db

    java -jar kafka/plugins/iceberg/iceberg-open-api-test-fixtures-runtime-*.jar > iceberg_rest.log 2>&1 &
    echo "confirm catalog is empty"
    sleep 2
    curl -sS http://$worker_host:$catalog_port/v1/namespaces  | jq
}
#-------
function stop_worker {
    kill -9 $(pidof java) 1>/dev/null 2>/dev/null || { echo "====Was not running"; }
}
#-------
function status_worker {
    echo "Checking status of worker on port $worker_port..."
    lsof -P -i :$worker_port && curl -sS http://$worker_host:$worker_port/connectors | jq
}
#-------
function status_iceberg_rest_catalog {
    echo "Checking status of iceberg rest catalog on port $catalog_port ..."
    lsof -P -i :$catalog_port  
    curl -sS http://$worker_host:$catalog_port/v1/namespaces  | jq
    curl -sS http://$worker_host:$catalog_port/v1/namespaces/dev/tables  | jq
}
#-------
function init_mc {
    mc alias set minio-1 http://nj1-4.minio-1.ext-0:1673 minioadmin minioadmin --api S3v4 --path auto
}

#-------
copy_connector_properties
init_mc

echo "script:info  node:nj1-4.kafkacw-1 omnode:nj1-4.kafkacw-1 option:$1 "
case $1 in
    start_clean)
        stop_worker
        start_worker
        if [ $CONNECTOR_DIRECTION = "sink" ]; then
            bucket_recreate
        fi
        #todo this should only be done for iceberg related connectors
        restart_iceberg_rest_catalog
        start_new_connector
    ;;
    stop)
        pause_latest_connector
         stop_worker
    ;;
    status)
        status_worker
        status_iceberg_rest_catalog
    ;;
    *)
    ;;
esac
