#!/bin/bash


function mysleep() {
    echo "sleeping $1 seconds..."
    sleep "$1"
}

source mn_set.sh

pkill atf_rdk
run_init=true
# run_init=false
max_topics=4


if [ "$run_init" = true ]; then
    echo "starting brokers."
    mn_brokers.sh
    mysleep 5

    # mn_topic_crt.sh
    echo "produce init data..."
    atf_rdk -n_p:1   -broker:$broker -max_topics:$max_topics
fi

atf_rdk -n_c:1 -run_id:c1 -broker:$broker -max_topics:$max_topics > temp/atf_rdk_logs/c_run_1.log 2>&1 &
pid1=$!
echo "started consumer pid=$pid1"

mysleep 1

atf_rdk -n_c:1 -run_id:c2 -broker:$broker -max_topics:$max_topics > temp/atf_rdk_logs/c_run_2.log 2>&1 &
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

