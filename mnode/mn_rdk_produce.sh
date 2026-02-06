#!/bin/bash

function mysleep() {
    echo "sleeping $1 seconds..."
    sleep "$1"
}

function start_consumer() {
    local wrk_id=$1
    local log_file="temp/atf_rdk_logs/${wrk_id}.log"
    atf_rdk -mode:c -wrk_id:"$wrk_id" -broker:"$broker" -max_topics:"$max_topics" -v -v > "$log_file" 2>&1 &
    local pid=$!
    # echo "started consumer wrk_id=$wrk_id pid=$pid log=$log_file"
    echo "$pid"
}

function stop_consumer() {
    local pid=$1
    kill "$pid"
    echo "killed consumer pid=$pid"
}

source mn_set.sh

pkill atf_rdk
run_init=true
# run_init=false
max_topics=10
max_msgs=1000

if [ "$run_init" = true ]; then
    echo "starting brokers."
    mn_brokers.sh
    mysleep 8

    mn_topic_crt.sh "$broker" "$max_topics"
    mysleep 5
    echo "produce init data..."
    atf_rdk -mode:p -broker:"$broker" -max_topics:"$max_topics" -max_msgs:"$max_msgs"
fi
exit

pid1=$(start_consumer c1)
echo "started c1 pid=$pid1"
mysleep 1
pid2=$(start_consumer c2)
echo "started c2 pid=$pid2"

mysleep 8
/opt/kafka/current/bin/kafka-consumer-groups.sh --bootstrap-server "$broker" --describe --group test_group_id
echo

mysleep 10
# stop_consumer "$pid1"
stop_consumer "$pid2"

mysleep 5
/opt/kafka/current/bin/kafka-consumer-groups.sh --bootstrap-server "$broker" --describe --group test_group_id
echo
