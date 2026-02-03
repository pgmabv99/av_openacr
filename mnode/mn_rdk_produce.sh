#!/bin/bash


function mysleep() {
    echo "sleeping $1 seconds..."
    sleep "$1"
}

source mn_set.sh

pkill atf_rdk
run_init=true
run_init=false

local_mode=true
local_mode=false

if [ "$local_mode" = true ]; then
    broker="localhost:54005"
elif [ "$local_mode" = false ]; then
    broker="nj1-4.x2-3.ext-0:1519"
fi

if [ "$run_init" = true ]; then
    # ------------- local
    if [ "$local_mode" = true ]; then
        x22sup_start.sh 
        broker="localhost:54005"
    elif [ "$local_mode" = false ]; then
        mn_brokers.sh 
        broker="nj1-4.x2-3.ext-0:1519"
        mysleep 5
    fi
    mysleep 5

    # mn_topic_crt.sh

    atf_rdk -n_p:1   -broker:$broker 
fi

atf_rdk -n_c:1 -run_id:c1 -broker:$broker > temp/atf_rdk_logs/c_run_1.log 2>&1 &
pid1=$!
echo "started consumer pid=$pid1"

mysleep 1

atf_rdk -n_c:1 -run_id:c2 -broker:$broker > temp/atf_rdk_logs/c_run_2.log 2>&1 &
pid2=$!
echo "started consumer pid=$pid2"

mysleep 10
/opt/kafka/current/bin/kafka-consumer-groups.sh   --bootstrap-server  $broker   --describe   --group test_group_id
echo 

# kill $pid1
# echo "killed consumer pid=$pid1"
kill $pid2
echo "killed consumer pid=$pid2"

mysleep 6 
/opt/kafka/current/bin/kafka-consumer-groups.sh   --bootstrap-server  $broker   --describe   --group test_group_id
echo 

