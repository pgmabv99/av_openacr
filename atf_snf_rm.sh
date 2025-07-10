#!/bin/bash

node=nj1.sn5.bm
x2rel  -product:atf_snf -node:$node -upload:Y -create:Y
x2node $node "sudo pkill atf_snf"
# prep the log file and directory to keep stdout
x2node $node "rm -rf   /home/dkrusr/atf_snf_logs_mytest1"
x2node $node "mkdir -p /home/dkrusr/atf_snf_logs_mytest1"
x2node $node "rm -rf   /home/dkrusr/atf_snf_stdout"

#  this runs in local backgound   the terminal
nohup x2node $node "sudo ./release/bin/atf_snf -dev:data0-8T -kapi:true -dir:/home/dkrusr/atf_snf_logs_mytest1 2>&1 | sudo tee /home/dkrusr/atf_snf_stdout > /dev/null " &
# run test (this will create traffic from ui/bench to backend)
# omcli dev.ak-8 -start_clean
omcli dev.ak-8 -omtest:om_benchmark -omrun_driver:kafka-debug -omrun_load:debug-workload100 -omrun_minutes:1
# force logs to be written
x2node $node "sudo pkill -SIGUSR1 atf_snf"
# av: todo to avoid sleep 
sleep 3
# show files and tail the last 2 lines
x2node $node "ls -ltr /home/dkrusr/atf_snf_logs_mytest1/tcp_pairs"
# kill background x2node
pkill -f  x2node