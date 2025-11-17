#setup 
omplat=ak
# omplat=x2

tap_omnnode=dev.x2-4.tap-1_ext_0  # device:nj1.sv2  omnode:kafka-1 node:dev.kafka-13
# tap_omnnode=dev.x2-4.tap-4_ext_0  # device:nj1.sv5 omnode:kafka-4 node:dev.kafka-16

if [ "$omplat" = "ak" ]; then
  server="dev.x2-4.kafka-1.ext-0:1643"
elif [ "$omplat" = "x2" ]; then
  server="192.168.104.5:1558"
else
  echo "unknown omplat:$omplat - no action"
fi
echo "setup  omplat:$omplat server:$server" 

# -----------------------------------------
# clean all
omcli dev.x2-4 -dkr_clean_run -omplat:ak
omcli dev.x2-4 -dkr_clean_run -omplat:x2



#  start brokers
if [ "$omplat" = "ak" ]; then
  echo "start kafka brokers"
  omcli dev.x2-4.kafka-% -omplat:ak -start_clean
elif [ "$omplat" = "x2" ]; then
  echo "install and start x2"
  x2rel  -create  -product:"x2|x2w" -omenv:dev.x2-4 -upload:Y  -create:Y
  omcli dev.x2-4.x2-% -omplat:x2 -start_clean
else
  echo "unknown omplat:$omplat - no action"
fi

omcli dev.x2-4.kafka-% -omplat:$omplat -status
omcli dev.x2-4.x2-% -omplat:$omplat -status


echo "install and start tap remotely"
x2rel  -create  -product:"tap" -omenv:dev.x2-4 -upload:Y  -create:Y 
omcli $tap_omnnode -ignore_omnode_use -start

echo "run tap locally"
sudo ~/arnd/bin/atf_snf -dev:data0-4T  -kapi  -dir:local -timestamp_log:N

echo "start kafkaui"
omcli dev.x2-4.kafkaui-1  -omplat:$omplat -start_clean

#  workloads 

# build all messages into a variable and send once
while :; do
  nrec=222
  msgs=""
  for i in $(seq 1 "$nrec"); do
    msgs+=$'message1\nmessage2\n'
  done
  printf '%s' "$msgs" | /opt/kafka/current/bin/kafka-console-producer.sh --bootstrap-server "$server" --topic test-topic
  echo "produce $nrec messages to test-topic"
  sleep 1
done

sleep 2
echo "consume  "
/opt/kafka/current/bin/kafka-console-consumer.sh \
  --bootstrap-server $server \
  --topic test-topic \
  --group test-consumer-group \
  --from-beginning \
  --property print.timestamp=true

# omcli dev.x2-4 -omtest:om_benchmark -omplat:ak -omrun_minutes:1
x2rel  -create  -product:"tap" -omenv:dev.x2-4 -upload:Y  -create:Y 
omcli dev.x2-4 -omtest:om_benchmark -omplat:ak -omrun_minutes:1 -omrun_driver:kafka-debug-idempotence -omrun_load:debug-simple


echo
sleep 2
/opt/kafka/current/bin/kafka-consumer-groups.sh \
    --bootstrap-server $server \
    --group test-consumer-group \
    --describe
sleep 2

echo "collect tap logs"
omcli $tap_omnnode -ignore_omnode_use -status
omcli $tap_omnnode -ignore_omnode_use -stop
sleep 4
omcli $tap_omnnode -ignore_omnode_use -collect_logs
atf_lat -omenv:dev.x2-4  


echo "stop kafka brokers locally "
/opt/kafka/current/bin/kafka-server-start.sh /opt/kafka/current/config/server.properties


#  x2write example
pkill -f x2traf
pkill -f x2write
pkill -f x2read
x2traf -payload:trafmsg -msg_size:10 -msg_rate:10 -traf_id:64 -tstamp:N -max_msgs:500 |
x2write -printacks:N -progress -max_inflight:0 -payload:trafmsg 

$ acr omnode:dev.x2-4%
omdb.omnode  omnode:dev.x2-4.kafka-1      node:dev.kafka-13    use:Y  comment:"kafka Broker node 1"
omdb.omnode  omnode:dev.x2-4.kafka-2      node:dev.kafka-14    use:Y  comment:"kafka Broker node 2"
omdb.omnode  omnode:dev.x2-4.kafka-3      node:dev.kafka-15    use:Y  comment:"kafka Broker node 3"
omdb.omnode  omnode:dev.x2-4.kafka-4      node:dev.kafka-16    use:Y  comment:"kafka Broker node 4"
omdb.omnode  omnode:dev.x2-4.kafkacw-1    node:dev.kafkacw-02  use:Y  comment:"s3 sink for tests"
omdb.omnode  omnode:dev.x2-4.kafkaui-1    node:dev.kafkaui-5   use:Y  comment:"Provectus UI node"
omdb.omnode  omnode:dev.x2-4.kafkaw-1     node:dev.kafkaw-04   use:Y  comment:""
omdb.omnode  omnode:dev.x2-4.kafkaw-2     node:dev.kafkaw-12   use:Y  comment:""
omdb.omnode  omnode:dev.x2-4.minio-1      node:dev.minio-02    use:Y  comment:"Apache Cluster s3"
omdb.omnode  omnode:dev.x2-4.rdp-1        node:dev.rdp-13      use:Y  comment:"rdp Broker node 1"
omdb.omnode  omnode:dev.x2-4.rdp-2        node:dev.rdp-14      use:Y  comment:"rdp Broker node 2"
omdb.omnode  omnode:dev.x2-4.rdp-3        node:dev.rdp-15      use:Y  comment:"rdp Broker node 3"
omdb.omnode  omnode:dev.x2-4.rdp-4        node:dev.rdp-16      use:Y  comment:"rdp Broker node 4"
omdb.omnode  omnode:dev.x2-4.rdpui-1      node:dev.rdpui-5     use:Y  comment:"Redpanda UI node"
omdb.omnode  omnode:dev.x2-4.tap-1_ext_0  node:nj1.sn2.bm      use:Y  comment:sniffer
omdb.omnode  omnode:dev.x2-4.tap-4_ext_0  node:nj1.sn5.bm      use:Y  comment:sniffer
omdb.omnode  omnode:dev.x2-4.x2-0         node:dev.x2-20       use:Y  comment:"x2 Broker node 1"
omdb.omnode  omnode:dev.x2-4.x2-1         node:dev.x2-18       use:Y  comment:"x2 Broker node 2"
omdb.omnode  omnode:dev.x2-4.x2-2         node:dev.x2-19       use:Y  comment:"x2 Broker node 3"
omdb.omnode  omnode:dev.x2-4.x2-3         node:dev.x2-17       use:Y  comment:"x2 Broker node 4"
omdb.omnode  omnode:dev.x2-4.x2w-1        node:dev.x2w-08      use:Y  comment:""
omdb.omnode  omnode:dev.x2-7.rdp-4        node:dev.rdp-04      use:Y  comment:"Apache Cluster Broker node 1"
report.acr  n_select:26  n_insert:0  n_delete:0  n_ignore:0  n_update:0  n_file_mod:0



bin/x2node  -node:$'dev.x2-4.tap-1_ext_0|dev.x2-4.tap-4_ext_0' -cmd:$'$\'cat temp/atf_snf_logs/dev.x2-4.tap-*/tcp_pairs_hist_42.log 2>/dev/null || true\'' -q:Y 