#!/bin/bash

node=nj1.sn5.bm
x2rel  -product:atf_snf -node:$node -upload:Y -create:Y
x2node $node "sudo pkill atf_snf"
# prep the log file and place to keep stdout
# atf_snf_logs should not  be deleted to acumulate logs
x2node $node "rm -rf /home/dkrusr/atf_snf_logs"
x2node $node "mkdir -p /home/dkrusr/atf_snf_logs"
x2node $node "rm -rf   /home/dkrusr/atf_snf_stdout"

#  this runs in local backgound   the terminal
nohup x2node $node "sudo ./release/bin/atf_snf -dev:data0-8T -kapi:true -dir:mytest1 2>&1 | sudo tee /home/dkrusr/atf_snf_stdout > /dev/null " &
# run test (this will create traffic from ui/bench to backend)
# omcli dev.ak-8 -start_clean
omcli dev.ak-8 -omtest:om_benchmark -omrun_driver:kafka-debug -omrun_load:debug-workload100 -omrun_minutes:1
# force logs to be written
x2node $node "sudo pkill -SIGUSR1 atf_snf"
# av: todo to avoid sleep 
sleep 3
# show files and tail the last 2 lines
echo "----show atf_snf logs"
x2node $node "ls -R /home/dkrusr/atf_snf_logs"
# kill remote atf_snf and background x2node
x2node $node "sudo pkill atf_snf"
pkill -f  x2node


x2node nj1.sn5.bm -shell