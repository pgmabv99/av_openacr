#!/bin/bash
echo "download ,build and start iceberg rest server"

cd $HOME
pkill -f 'iceberg-open-api-test-fixtures-runtime'

rm -rf iceberg
git clone https://github.com/apache/iceberg.git
cd iceberg

./gradlew :iceberg-open-api:shadowJar


cd $HOME/iceberg
export AWS_ACCESS_KEY_ID=minioadmin
export AWS_SECRET_ACCESS_KEY=minioadmin
export AWS_REGION=us-east-1
export CATALOG_WAREHOUSE=s3://bucket-dev.x2-4.kafkacw-1/
export CATALOG_IO__IMPL=org.apache.iceberg.aws.s3.S3FileIO
export CATALOG_S3_ENDPOINT=http://192.168.104.1:1673
export CATALOG_S3_PATH_STYLE_ACCESS=true
export CATALOG_CATALOG__IMPL=org.apache.iceberg.jdbc.JdbcCatalog
export CATALOG_URI=jdbc:sqlite:/tmp/iceberg_catalog.db
export CATALOG_JDBC_USER=user
export CATALOG_JDBC_PASSWORD=password
export CATALOG_JDBC_STRICT__MODE=true
export CATALOG_REST_PORT=1758

echo "kill current rest server"
pkill -f 'iceberg-open-api-test-fixtures-runtime'

echo "remove old jdbc db"
rm -f /tmp/iceberg_catalog.db

java -jar open-api/build/libs/iceberg-open-api-test-fixtures-runtime-*.jar > $HOME/iceberg_rest.log 2>&1 &
sleep 5

curl http://localhost:$CATALOG_REST_PORT/v1/config | jq
curl -s http://localhost:$CATALOG_REST_PORT/v1/namespaces | jq
cat $HOME/iceberg_rest.log | tail -50