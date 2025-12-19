#!/bin/bash


source mn_set.sh


echo "====================starting produce"
# skip delete as  x2 crashes 11/26
# /opt/kafka/current/bin/kafka-topics.sh --bootstrap-server "$server" --delete --topic ${topic} || true
# sleep 1
/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server "$server" --create --topic ${topic} --partitions 1 --replication-factor 1
sleep 1
/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server "$server" --describe --topic "$topic"

sleep 2


echo "producing 
# one producer instance

{
  for ((ibatch=1; ibatch<=nbatch; ibatch++)); do
    for ((irec=1; irec<=nrec; irec++)); do
      echo "batch${ibatch}_message${irec}"
    done
    echo "---- batch ${ibatch} message${nrec} done ----" >&2
    sleep 1
  done
} | /opt/kafka/current/bin/kafka-console-producer.sh \
        --bootstrap-server "$server" \
        --topic "$topic"

exit

/opt/kafka/current/bin/kafka-metadata-shell.sh --bootstrap-server nj1-4.kafka-1.ext-0:1643 --describe