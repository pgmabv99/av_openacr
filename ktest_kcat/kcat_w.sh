#!/bin/bash
echo "wait for broker up"
source ~/av_openacr/ktest_kcat/hosts.sh

while ! kcat -b $host:$port  -L >/dev/null 2>&1; do
    echo -n "."
    sleep 2
done
echo  " broker up"
