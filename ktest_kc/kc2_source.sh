#!/bin/bash

# kc2_clean.sh

echo "==show s3 bucket before start"
omcli  dev.x2-4.minio-1  -status 
# cofluent
# omcli  dev.x2-4.kafkacw-1  -start_clean  -omplat:ak -omrun_connect:confluent-s3source.dflt -omrun_worker:kafka-connect.dflt 
# aiven 
omcli  dev.x2-4.kafkacw-1  -start_clean  -omplat:ak -omrun_connect:aiven-s3source.dflt -omrun_worker:kafka-connect.dflt 
sleep 10
echo "==start consumer"
kcat_c.sh