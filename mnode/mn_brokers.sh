#!/bin/bash
source mn_set.sh

mn_clean.sh

start_ak_brokers() {
  echo "===========start kafka brokers"
  omcli nj1-4.kafka-% -omplat:ak -dkr_clean_run
  omcli nj1-4.kafka-% -omplat:ak -start_tap
  omcli nj1-4.kafka-% -omplat:ak -start_clean 
}

start_x2_brokers() {
  echo "===========start x2"
  omcli nj1-4.x2-% -omplat:x2 -dkr_clean_run
  echo "install x2"
  x2rel -create -product:"x2|x2w" -omenv:nj1-4 -upload:Y -create:Y    
  echo "start x2"
  omcli nj1-4.x2-% -omplat:x2 -start_tap
  omcli nj1-4.x2-% -omplat:x2 -start_clean -debug_x2sup 
}

start_ak_ui() {
  echo "===========start kafka ui"
  omcli nj1-4.kafkaui-% -omplat:$omplat -dkr_clean_run
  omcli nj1-4.kafkaui-1  -omplat:$omplat -start_clean
}

if [ "$omplat" = "ak" ]; then
  start_ak_brokers
  start_ak_ui
elif [ "$omplat" = "x2" ]; then
  start_x2_brokers
  start_ak_ui
elif [ "$omplat" = "x2/ak" ]; then
  start_x2_brokers
  start_ak_brokers
else
  echo "unknown omplat:$omplat - no action"
fi


exit 
# =====================================
# echo "start rdpui"
# omcli nj1-4.rdpui-1  -omplat:$omplat -start_clean

