#!/bin/bash
# mc rb --force iceberg-warehouse
# mc mb iceberg-warehouse

  docker run -d -p 8181:8181 \
  -e AWS_ACCESS_KEY_ID=minioadmin \
  -e AWS_SECRET_ACCESS_KEY=minioadmin \
  -e AWS_REGION=us-east-1 \
  -e CATALOG_WAREHOUSE=s3://iceberg-warehouse/ \
  -e CATALOG_IO__IMPL=org.apache.iceberg.aws.s3.S3FileIO \
  -e CATALOG_S3_ENDPOINT=http://http://dev.x2-4.minio-1.ext-0:1673 \
  -e CATALOG_S3_PATH-STYLE-ACCESS=true \
  apache/iceberg-rest-fixture:latest