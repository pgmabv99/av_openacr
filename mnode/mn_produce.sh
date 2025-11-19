#!/bin/bash


source mn_set.sh
/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server "$server" --delete --topic ${topic} || true
sleep 1
/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server "$server" --create --topic ${topic} --partitions 3 --replication-factor 1
# build all messages into a variable and send once
for ((ii=0; ii<1; ii++)); do
  nrec=10
  msgs=""
  for i in $(seq 1 "$nrec"); do
    msgs+="message${i}"$'\n'
  done
  printf '%s' "$msgs" | /opt/kafka/current/bin/kafka-console-producer.sh --bootstrap-server "$server" --topic ${topic}
  echo "produce $nrec messages to ${topic} on $server"
  sleep 1
done

