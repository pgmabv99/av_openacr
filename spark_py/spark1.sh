#!/bin/bash
export SPARK_HOME=/opt/spark
export PATH=$SPARK_HOME/bin:$PATH
set -x
# spark-submit --version
# spark_server=spark://spark-master.example.com:7077
spark_server=spark://spark-main.algox2.com/:7077
spark-submit \
    --master $spark_server \
    --deploy-mode client \
    spark1.py
