#!/bin/bash
set -x
pkill consumer
rm -rf ~/av_openacr/ktest/logs/consumer*.log
producer > ~/av_openacr/ktest/logs/producer.log 2>&1 
N=2
echo "starting consumers"
for i in $(seq 1 $N); do
    consumer > ~/av_openacr/ktest/logs/consumer${i}.log 2>&1 &
    sleep 0.5
done
sleep 80
pkill consumer
echo "consumers stopped"