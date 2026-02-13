#!/bin/bash
KAFKA_BROKERS=nj1-4.kafka-1.ext-0:1643
AWS_ENDPOINT_URL=http://nj1-4.minio-1.ext-0:1673
TOPIC=web_requests
FILE=tests/json/web_requests-100.json   
/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server $KAFKA_BROKERS --topic $TOPIC --delete --if-exists
/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server $KAFKA_BROKERS --topic $TOPIC --create --if-not-exists

echo "produce to topic $TOPIC from file $FILE"
/opt/kafka/current/bin/kafka-console-producer.sh --broker-list $KAFKA_BROKERS --topic $TOPIC < $FILE

echo "consume from topic $TOPIC and count records. offsets not committed, so can be re-run to get the same count"
kcat -b $KAFKA_BROKERS -t $TOPIC -C -o beginning -e | wc -l


echo "reset  previous local  data"
./bin/clean-example-data.sh


echo "create minio bucket and copy local delta log file to minio .. hugh ???"
mc alias set myminio  $AWS_ENDPOINT_URL minioadmin minioadmin --api S3v4 --path auto
mc rb --force myminio/kdi-bucket
mc mb myminio/kdi-bucket
mc mb myminio/kdi-bucket/delta/web_requests/_delta_log/
mc cp tests/data/web_requests/_delta_log/00000000000000000000.json myminio/kdi-bucket/delta/web_requests/_delta_log/
mc ls -r myminio/kdi-bucket/delta/web_requests/_delta_log/
