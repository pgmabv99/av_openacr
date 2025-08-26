#!/bin/bash
kc2_clean.sh
# echo "recreate topic - need to do it before start kafka connect -else  need wait "
# source ~/av_openacr/ktest_kcat/hosts.sh
# source ~/av_openacr/venv/bin/activate
# python3 ~/av_openacr/ktest_python/top_recreate.py $host:$port $topic


echo "produce  few messages"
kcat_p.sh
echo "start kafka connect (10 sec ??)"
omcli  dev.x2-4.kafkacw-1  -start_clean  -omplat:ak 
# omcli  dev.x2-4.kafkacw-1  -start_clean  -omplat:ak -omrun_connect:confluent-s3sink.dflt -omrun_worker:kafka-connect.dflt 


echo "==show s3 bucket immediatly after start"
omcli  dev.x2-4.minio-1  -status 
echo "==show s3 bucket after sleep 10"
sleep 10
omcli  dev.x2-4.minio-1  -status 