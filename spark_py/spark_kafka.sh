#!/bin/bash


echo "run spark kafka read/ delata write example"
broker="${1:-nj1-4.kafka-1.ext-0:1643}"
# broker=nj1-4.x2-3.ext-0:1519

export SPARK_HOME=/opt/spark
export PATH=$SPARK_HOME/bin:$PATH
# spark-submit --version
# spark_server=spark://spark-master.example.com:7077
spark_server=spark://spark-main.algox2.com/:7077

topic=test-topic
echo "recreate topic $topic .. this fails with x2"
/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server $broker --topic $topic --delete --if-exists

set -eu
/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server $broker --topic $topic --create --if-not-exists

echo "produce to topic $topic"
/opt/kafka/current/bin/kafka-console-producer.sh \
  --broker-list $broker \
  --topic $topic <<EOF
{"id":1,"name":"alice","age":25}
{"id":2,"name":"bob","age":30}
{"id":3,"name":"carol","age":22}
{"id":4,"name":"dave","age":28}
{"id":5,"name":"eve","age":35}
{"id":6,"name":"frank","age":27}
{"id":7,"name":"grace","age":31}
{"id":8,"name":"heidi","age":29}
{"id":9,"name":"ivan","age":26}
{"id":10,"name":"judy","age":33}
EOF
kcat -b $broker -t $topic -C -o beginning -e | wc -l

rm -rf checkpoints/*
spark_server=spark://spark-main.algox2.com/:7077

#  remove stderr redirection to get 3 pages of output (maybe ussful for packages download debugging)
spark-submit \
  --deploy-mode client \
  --packages org.apache.spark:spark-sql-kafka-0-10_2.13:4.0.2,io.delta:delta-spark_2.13:4.0.1 \
  spark_kafka.py --broker "$broker" 2> /dev/null
