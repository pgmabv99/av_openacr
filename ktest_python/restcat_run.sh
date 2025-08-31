#!/bin/bash

# cd $HOME
# pkill -f 'iceberg-open-api-test-fixtures-runtime'

# rm -rf iceberg
# git clone https://github.com/apache/iceberg.git
# cd iceberg

# ./gradlew :iceberg-open-api:shadowJar

export AWS_ACCESS_KEY_ID=minioadmin
export AWS_SECRET_ACCESS_KEY=minioadmin
export AWS_REGION=us-east-1
export CATALOG_WAREHOUSE=s3://iceberg-warehouse/
export CATALOG_IO__IMPL=org.apache.iceberg.aws.s3.S3FileIO
export CATALOG_S3_ENDPOINT=http://192.168.104.1:1673
export CATALOG_S3_PATH_STYLE_ACCESS=true
export CATALOG_CATALOG__IMPL=org.apache.iceberg.jdbc.JdbcCatalog
export CATALOG_URI=jdbc:sqlite:/tmp/iceberg_catalog.db
export CATALOG_JDBC_USER=user
export CATALOG_JDBC_PASSWORD=password
export CATALOG_JDBC_STRICT__MODE=true
# export REST_PORT=8181
export REST_PORT=1758
export JETTY_HTTP_PORT=1758
export JETTY_PORT=1758
cd $HOME/iceberg
pkill -f 'iceberg-open-api-test-fixtures-runtime'
java  -Djetty.http.port=$REST_PORT -jar open-api/build/libs/iceberg-open-api-test-fixtures-runtime-*.jar > $HOME/iceberg_rest.log 2>&1 &
sleep 5
curl http://localhost:$REST_PORT/v1/config | jq
curl -s http://localhost:$REST_PORT/v1/namespaces | jq
cat $HOME/iceberg_rest.log | tail -50