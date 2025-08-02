#!/bin/bash



x2rel  -create  -product:x2 -omenv:dev.x2-4 -upload  
x2rel  -upload  -product:x2 -omnode:dev.x2-4.x2%  

x2rel  -create  -product:tap -omnode:dev.ak-8.tap-4_ext_0 -upload  


echo "---------------------clean start ONE node + rdpui"
omcli dev.x2-4.x2_0 -shell_cmd:"rm -rf release/dev-x2-4.x2sup-0-0.log"
omcli dev.x2-4.x2_0 -shell_cmd:"rm -rf release/core.*"
omcli dev.x2-4.x2_0 -start_clean -debug_x2sup:Y
omcli dev.x2-4.rdpui-1 -start_clean
# omcli dev.x2-4.rdpui-1 -shell_cmd:"printf '%s\n' 'kafka:' '  brokers: [dev.x2-4.x2-0.ext-0:1558]' > rdp_console.yaml"
# omcli dev.x2-4.kafkaui-1 -shell_cmd:'./kafkaui_only start_clean'
# omcli dev.x2-4.kafkaui-1 -start_clean

exit



echo " short benchmark with 1 broker"
omcli         dev.x2-4 -omtest:om_benchmark -omrun_driver:kafka-debug -omrun_load:debug-workload -omrun_minutes:1


omcli dev.x2-4.% -collect_logs


omenv=dev.ak-8
for i in {1..4}; do
    echo "Node $i IP:"
    ip_addr=$(omcli $omenv.kafka-$i -shell_cmd:"getent hosts $omenv.kafka-$i.ext-0" | awk '{print $1}')
    if [[ -n "$ip_addr" ]]; then
        iface=$(ip -o addr show | awk -v ip="$ip_addr" '$4 ~ ip"/" {print $2}')
        echo "IP: $ip_addr, Interface: $iface"
    else
        echo "IP not found"
    fi
done


#  docker reset
omcli dev.x2-4.kafkaui-1   -dkr_clean_run
omcli dev.x2-4.rdpui-1     -dkr_clean_run
dkr -clean_run -node:dev.kafka-14
echo "---------------------status"
sudo lsof -nP -iTCP -sTCP:LISTEN | grep x2gw
lsof -P -i :1519

#  ----- omplat 

x2rel  -create  -product:tap -omnode:dev.x2-4.tap-1_ext_0  -upload  

omplat=ak
broker=dev.x2-4.kafka-1
ui=dev.x2-4.kafkaui-1
tap=dev.x2-4.tap-1_ext_0

omcli $broker -omplat:$omplat -dkr_clean_run
omcli $ui -omplat:$omplat -dkr_clean_run
omcli $tap -omplat:$omplat -stop
x2rel  -create  -product:tap -omnode:$tap -upload  


omcli $tap -omplat:$omplat -start_clean
omcli $broker -omplat:$omplat -start_clean ;  
omcli $ui -omplat:$omplat -start_clean
sleep 10

omcli $broker -omplat:$omplat -stop ;
omcli $ui -omplat:$omplat -stop
omcli $tap -omplat:$omplat -stop

omcli dev.x2-4% -omplat:$omplat -collect_logs


x2node  -node:dev.kafka-13 -rsync_get:Y -rsync_opts:-aic -local:temp/collect_logs/ak/2025.08.01.17.21/dev.x2-4.kafka-1/ -remote:kafka/logs/*.log  


omcli  -selector:dev.x2-4.% -omplat:ak -omtest:om_benchmark -omrun_driver:kafka-debug -omrun_load:debug-workload100