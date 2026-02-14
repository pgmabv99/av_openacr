#!/bin/bash

echo " kill existing kdi processes"
pkill -f kafka-delta-ingest

export KAFKA_BROKERS=nj1-4.kafka-1.ext-0:1643
export KAFKA_BROKERS=nj1-4.x2-3.ext-0:1519

export AWS_ENDPOINT_URL=http://nj1-4.minio-1.ext-0:1673
export AWS_ACCESS_KEY_ID=minioadmin
export AWS_SECRET_ACCESS_KEY=minioadmin
export AWS_ALLOW_HTTP=true
echo " run kdi ingest"

minio=true
# minio=false
if [ "$minio" = false ]; then
  echo " local ingest to local  file broker $KAFKA_BROKERS "
  RUST_LOG=debug cargo run --features s3,dynamic-linking ingest web_requests ./tests/data/web_requests \
    --allowed_latency 60 \
    --app_id web_requests \
    --transform 'date: substr(meta.producer.timestamp, `0`, `10`)' \
    --transform 'meta.kafka.offset: kafka.offset' \
    --transform 'meta.kafka.partition: kafka.partition' \
    --transform 'meta.kafka.topic: kafka.topic' \
    --auto_offset_reset earliest 
else
  echo " remote ingest to  minio broker $KAFKA_BROKERS  endpoint $AWS_ENDPOINT_URL"
  RUST_LOG=debug cargo run --features s3,dynamic-linking -- ingest \
    web_requests \
    s3://kdi-bucket/delta/web_requests \
    --allowed_latency 60 \
    --app_id web_requests \
    --transform 'date: substr(meta.producer.timestamp, `0`, `10`)' \
    --transform 'meta.kafka.offset: kafka.offset' \
    --transform 'meta.kafka.partition: kafka.partition' \
    --transform 'meta.kafka.topic: kafka.topic' \
  --auto_offset_reset earliest
fi