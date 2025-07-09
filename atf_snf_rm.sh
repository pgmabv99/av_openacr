#!/bin/bash

# omenv=dev.ak-8
# omcli $omenv -dkr_clean_run
# # x2rel.error  x2rel: can't find a default topology for omenv:dev.ak-8 
# # omcli $omenv -stop
# x2rel -create  -product:atf_snf -omenv:$omenv
# x2rel  -upload -product:atf_snf -omnode:$omenv%

# node_list=($(acr omnode:dev.ak-8.% -field:node))
# for node in "${node_list[@]}"; do
#     echo "$node"

#     # node=dev.kafka-01
#     # x2node $node -rsync_put -local:$(readlink -f bin/atf_snf) -remote:atf_snf
#     # x2node $node "sudo ./atf_snf -list"
#     cat /etc/os-release | grep "^PRETTY_NAME="
# done


node=nj1.sn2.bm
x2rel  -product:atf_snf -node:$node -upload:Y -create:Y
x2node $node "sudo ./release/bin/atf_snf -list"