#!/bin/bash


#  docker reset
omcli dev.x2-4.kafkaui-1   -dkr_clean_run
omcli dev.x2-4.rdpui-1     -dkr_clean_run

omcli dev.ak-8% -start_clean
# prod deployment on all nodes :source from x2-17
ai
set -e
omcli dev.x2-4.x2% -stop
x2rel -create  -product:x2 -omenv:dev.x2-4 -force
x2rel  -upload -product:x2 -omnode:dev.x2-4.x2%  -force
omcli dev.x2-4.x2% -start_clean
omcli dev.x2-4.rdpui-1 -start_clean
omcli dev.x2-4.x2% -status

echo "---------------------status"
sudo lsof -nP -iTCP -sTCP:LISTEN | grep x2gw
lsof -P -i :1519


echo "---------------------clean start ONE node + rdpui"
omcli dev.x2-4.% -stop
omcli dev.x2-4.x2-0 -start_clean
omcli dev.x2-4.rdpui-1 -shell_cmd:'./rdpui_only start_clean'  
omcli dev.x2-4.kafkaui-1 -shell_cmd:'./kafkaui_only start_clean'  

echo "---------------------status"
omcli dev.x2-4.x2-0  -status
omcli dev.x2-4.rdpui-1 -status 
omcli dev.x2-4.kafkaui-1 -status 
.


echo "---------------------clean start ALL  node + rdpui"
omcli dev.x2-4.% -stop
omcli dev.x2-4.x2-% -start_clean
omcli dev.x2-4.rdpui-1 -start_clean
echo "---------------------status"
omcli dev.x2-4.x2-% -status 
omcli dev.x2-4.rdpui-1 -status 

echo " short benchmark with 1 broker"
omcli         dev.x2-4 -omtest:om_benchmark -omrun_driver:kafka-debug -omrun_load:debug-workload -omrun_minutes:1

omenv_logs.sh
