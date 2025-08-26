#!/bin/bash
# ===============================
echo "docker clean"
omcli  dev.x2-4.%  -dkr_clean_run -omplat:ak
echo "start brokers , x2w,  ui, minio"
c
omcli  dev.x2-4.x2w-%  -start_clean -omplat:ak
omcli  dev.x2-4.kafkaui%  -start_clean -omplat:ak
omcli  dev.x2-4.minio-1  -start_clean 


#wait for broker up
kcat_w.sh
