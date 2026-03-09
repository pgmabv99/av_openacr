#!/bin/bash
source mn_set.sh
cfg=${1:-release}


start_ak_brokers() {
  echo "===============================================================start kafka brokers omplat:$omplat"
  omcli nj1-4.kafka-% -omplat:ak -dkr_clean_run
  x2rel -create -product:"tap" -node:nj1-4.kafka-% -node_selects_x2:false -upload:Y -create:Y     
  omcli nj1-4.kafka-% -omplat:ak -start_tap
  omcli nj1-4.kafka-% -omplat:ak -start_clean 
}

start_x2_brokers() {
  echo "===============================================================start x2 brokers omplat:$omplat"
  omcli nj1-4.x2-% -omplat:x2 -dkr_clean_run
  echo "install x2"
  x2rel -create -product:"x2|x2w" -omenv:nj1-4 -upload:Y -create:Y   -cfg:$cfg 
  echo "start x2"
  omcli nj1-4.x2-% -omplat:x2 -start_tap
  debug_x2sup=""
  debug_x2sup="-debug_x2sup"
  if [ "$debug_x2sup" != "" ]; then
    debug_x2sup="-debug_x2sup"
    echo "debug x2sup enabled !!!!!!!!!!!!!!!!!!!!!!!!!!!SLOW PERFORMANCE!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  fi
  omcli nj1-4.x2-% -omplat:x2 -start_clean $debug_x2sup
}

start_ak_ui() {
  echo "===============================================================start kafka ui omplat:$omplat"
  omcli nj1-4.kafkaui-1 -omplat:$omplat -dkr_clean_run
  omcli nj1-4.kafkaui-1  -omplat:$omplat -start_clean
}

start_minio() {
  echo "===============================================================start minio"
  omcli nj1-4.minio-1 -dkr_clean_run  -ignore_node_passive
  omcli nj1-4.minio-1  -start_clean  -ignore_node_passive
}


# clean and start common services before brokers as brokers may need them
if [ "$omplat" != "local" ]; then
  mn_clean.sh
  start_minio
fi

# start brokers
if [ "$omplat" = "ak" ]; then
  start_ak_brokers
elif [ "$omplat" = "x2" ]; then
  start_x2_brokers
elif [ "$omplat" = "x2/ak" ]; then
  start_x2_brokers
  start_ak_brokers
elif [ "$omplat" = "local" ]; then
  x22sup_start.sh 
else
  echo "unknown omplat:$omplat - no action"
fi

# start post brokers services if needed
# if [ "$omplat" != "local" ]; then
#   start_ak_ui
# fi

