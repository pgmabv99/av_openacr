#!/bin/bash
kc2_clean.sh
# echo "recreate topic - need to do it before start kafka connect -else  need wait "
# source ~/av_openacr/ktest_kcat/hosts.sh
# source ~/av_openacr/venv/bin/activate
# python3 ~/av_openacr/ktest_python/top_recreate.py $host:$port $topic


echo "produce  few messages"
kcat_p.sh
echo "upload kafka connect iceberg sink plugin"
x2node dev.kafkacw-02 -rsync_put \
-local /home/avorovich/iceberg/kafka-connect/kafka-connect-runtime/build/distributions/iceberg-kafka-connect-runtime-1.11.0-SNAPSHOT.zip \
-remote /home/kafkausr/kafka/plugins/iceberg-kafka-connect-runtime-1.11.0-SNAPSHOT.zip
x2node dev.kafkacw-02 "unzip -o /home/kafkausr/kafka/plugins/iceberg-kafka-connect-runtime-1.11.0-SNAPSHOT.zip -d /home/kafkausr/kafka/plugins"


echo "start kafka connect (10 sec ??)"
omcli  dev.x2-4.kafkacw-1  -start_clean  -omplat:ak -omrun_connect:apache-iceberg-sink.dflt -omrun_worker:kafka-connect.dflt 


echo "==show s3 bucket immediatly after start"
omcli  dev.x2-4.minio-1  -status 
echo "==show s3 bucket after sleep 10"
sleep 10
omcli  dev.x2-4.minio-1  -status 
curl -s http://192.168.10.51:1758/v1/namespaces/dev/tables | jq
curl -s http://192.168.10.51:1758/v1/namespaces/dev/tables/mytesttable | jq
