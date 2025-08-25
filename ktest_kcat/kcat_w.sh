#!/bin/bash
echo "wait for broker up"
source ~/av_openacr/ktest_kcat/hosts.sh

# while ! omcli dev.x2-4.kafka-1 -omplat:ak -kcat_cmd:"-L"  ; do
# while ! kcat -b $host:$port  -L ; do
while ! kcat -b $host:$port  -L >/dev/null 2>&1; do
    echo -n "."
    sleep 2
done
echo  " broker up"
