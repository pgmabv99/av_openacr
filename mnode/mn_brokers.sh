#!/bin/bash
source mn_set.sh
if [ "$omplat" = "ak" ]; then
  echo "start kafka brokers"
  omcli dev.x2-4.kafka-% -omplat:ak -start_clean  

elif [ "$omplat" = "x2" ]; then

  echo "install  x2"
  x2rel  -create  -product:"x2|x2w" -omenv:dev.x2-4 -upload:Y  -create:Y    
  echo " start x2"
  omcli dev.x2-4.x2-% -omplat:x2 -start_clean -debug_x2sup 
else
  echo "unknown omplat:$omplat - no action"
fi

# echo "start rdpui"
# omcli dev.x2-4.rdpui-1  -omplat:$omplat -start_clean

# echo "start kafkaui"
# omcli dev.x2-4.kafkaui-1  -omplat:$omplat -start_clean

exit 
# =====================================

