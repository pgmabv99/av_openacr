#!/bin/bash
# ===============================
echo "docker clean"
omcli  dev.x2-4.%  -dkr_clean_run -omplat:ak
echo "start brokers , ui, minio"
omcli  dev.x2-4.kafka-%  -start_clean -omplat:ak
omcli  dev.x2-4.kafkaui%  -start_clean -omplat:ak
omcli  dev.x2-4.minio-1  -start_clean 

# nn=45
# echo "sleep $nn"
# sleep $nn
# echo "recreate topic - need to do it before start kafka connect -else  need wait "
# source ~/av_openacr/ktest_kcat/hosts.sh
# source ~/av_openacr/venv/bin/activate
# python3 ~/av_openacr/ktest_python/top_recreate.py $host:$port $topic

# start kafka connect (10 sec ??)
omcli  dev.x2-4.kafkacw-1  -start_clean  -omplat:ak
omcli  dev.x2-4.kafkacw-1  -start_clean  -omplat:ak -omrun_connect:confluence-s3sink.dflt -omrun_worker:kafka-connect.dflt 

echo "produce  few messages"
kcat_p.sh

echo "show s3 bucket"
omcli  dev.x2-4.minio-1  -status 

echo "get connector status and logs "
omcli dev.x2-4.kafkacw-1 -shell_cmd:"curl -sS http://dev.x2-4.kafkacw-1.ctrl-0:1683/connectors | jq ."
omcli dev.x2-4.kafkacw-1 -shell_cmd:"curl -sS http://dev.x2-4.kafkacw-1.ctrl-0:1683/connectors/dev.x2-4.kafkacw-1-1  | jq ."
omcli dev.x2-4.kafkacw-1 -shell_cmd:"curl -sS http://dev.x2-4.kafkacw-1.ctrl-0:1683/connectors/dev.x2-4.kafkacw-1-CIDX | jq ."
omcli dev.x2-4.kafkacw-1 -shell_cmd:"grep Processing /home/kafkausr/kafka/logs/connectDistributed.out"

