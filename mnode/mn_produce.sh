#!/bin/bash


source mn_set.sh


echo "====================starting produce"
# skip delete as  x2 crashes 11/26
# /opt/kafka/current/bin/kafka-topics.sh --bootstrap-server "$server" --delete --topic ${topic} || true
# sleep 1
/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server "$server" --create --topic ${topic} --partitions 3 --replication-factor 1


# produce loop 
nbatch=9999
nrec=20

# multiple producer instance 
# for ((ii=0; ii<nbatch; ii++)); do
#   msgs=""
#   for i in $(seq 1 "$nrec"); do
#     msgs+="batch${ii}_message${i}"$'\n'
#   done
#   printf '%s' "$msgs" | /opt/kafka/current/bin/kafka-console-producer.sh --bootstrap-server "$server" --topic ${topic}
#   echo "produce batch ${ii} $nrec messages to ${topic} on $server"
#   sleep 1
# done


# one producer instance
{
  for ((ii=0; ii<nbatch; ii++)); do
    for ((i=1; i<=nrec; i++)); do
      echo "batch${ii}_message${i}"
    done
    echo "---- batch ${ii} done ----" >&2
    sleep 1
  done
} | /opt/kafka/current/bin/kafka-console-producer.sh \
        --bootstrap-server "$server" \
        --topic "$topic"

