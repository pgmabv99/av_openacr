#!/bin/bash
KAFKA_BROKERS="${1:-nj1-4.kafka-1.ext-0:1643}"
AWS_ENDPOINT_URL="${2:-http://nj1-4.minio-1.ext-0:1673}"
# KAFKA_BROKERS=nj1-4.x2-3.ext-0:1519

TOPIC=web_requests
FILE=tests/json/web_requests-100.json   
/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server $KAFKA_BROKERS --topic $TOPIC --delete --if-exists
/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server $KAFKA_BROKERS --topic $TOPIC --create --if-not-exists

echo "Produce to topic $TOPIC from file $FILE broker $KAFKA_BROKERS"
/opt/kafka/current/bin/kafka-console-producer.sh --broker-list $KAFKA_BROKERS --topic $TOPIC < $FILE

echo "Consume from topic $TOPIC and count records. Offsets not committed, so can be re-run to get the same count"
kcat -b $KAFKA_BROKERS -t $TOPIC -C -o beginning -e | wc -l


echo "reset  previous local  data"
cd ~/kafka-delta-ingest
./bin/clean-example-data.sh


echo "create minio bucket and copy local delta log file to minio .. hugh ???"
mc alias set myminio  $AWS_ENDPOINT_URL minioadmin minioadmin --api S3v4 --path auto
mc rb --force myminio/kdi-bucket
mc mb myminio/kdi-bucket
mc mb myminio/kdi-bucket/delta/web_requests/_delta_log/
mc cp tests/data/web_requests/_delta_log/00000000000000000000.json myminio/kdi-bucket/delta/web_requests/_delta_log/
mc ls -r myminio/kdi-bucket/delta/web_requests/_delta_log/
