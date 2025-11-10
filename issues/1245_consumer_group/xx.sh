
echo "kafka single node" 
server=dev.x2-4.kafka-4.ext-0:1664

echo "x2 single node"
server=192.168.104.5:1664
tap_omnnode=dev.x2-4.tap-4_ext_0 
# tap_omnnode=dev.x2-4.tap-1_ext_0

omcli dev.x2-4 -dkr_clean_run -omplat:ak
omcli dev.x2-4 -dkr_clean_run -omplat:x2

omcli dev.x2-4.kafka-% -omplat:ak -status
omcli dev.x2-4.x2-% -omplat:x2 -status

echo "start kafka brokers"
omcli dev.x2-4.kafka-% -omplat:ak -start_clean

echo "install and start x2"
x2rel  -create  -product:"x2|x2w" -omenv:dev.x2-4 -upload:Y  -create:Y
omcli dev.x2-4.x2-% -omplat:x2 -start_clean

echo "start kafkaui"
omcli dev.x2-4.kafkaui-1  -omplat:x2 -start_clean



echo -e "message1\nmessage2" | \
/opt/kafka/current/bin/kafka-console-producer.sh \
    --bootstrap-server $server \
    --topic test-topic
sleep 2
/opt/kafka/current/bin/kafka-console-consumer.sh \
  --bootstrap-server $server \
  --topic test-topic \
  --group test-consumer-group \
  --from-beginning \
  --property print.timestamp=true

# omcli dev.x2-4 -omtest:om_benchmark -omplat:ak -omrun_minutes:1

echo "install and start tap"
x2rel  -create  -product:"tap" -omenv:dev.x2-4 -upload:Y  -create:Y 
omcli $tap_omnnode -ignore_omnode_use -start

sleep 2
/opt/kafka/current/bin/kafka-consumer-groups.sh \
    --bootstrap-server $server \
    --group test-consumer-group \
    --describe
sleep 2
omcli $tap_omnnode -ignore_omnode_use -stop
sleep 4
omcli $tap_omnnode -ignore_omnode_use -collect_logs

/opt/kafka/current/bin/kafka-server-start.sh /opt/kafka/current/config/server.properties

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

root@nj1.sv2:~# docker ps --format "table {{.Names}}\t{{.Image}}\t{{.CreatedAt}}\t{{.Status}}" | sort
kafka-01        kafka          2025-09-08 12:55:39 -0400 EDT   Up 4 days
kafka-09        kafka          2025-11-05 14:06:07 -0500 EST   Up 32 minutes
kafka-13        kafka          2025-11-05 12:33:26 -0500 EST   Up 2 hours
NAMES           IMAGE          CREATED AT                      STATUS
rdp-1           rdp            2025-07-31 23:14:28 -0400 EDT   Up 4 days
rdp-4           rdp            2025-07-07 16:41:09 -0400 EDT   Up 4 days
rdp-9           rdp            2025-11-05 14:10:10 -0500 EST   Up 28 minutes
user-alebedev   d0098459995d   2025-09-08 15:37:37 -0400 EDT   Up 4 days
user-apolov     user           2025-10-03 03:51:09 -0400 EDT   Up 4 days
user-vparizhs   d0098459995d   2025-09-08 15:37:35 -0400 EDT   Up 4 days
x2-01           x2             2025-11-05 12:58:09 -0500 EST   Up 2 hours
x2-05           x2             2025-10-30 11:42:23 -0400 EDT   Up 4 days
x2-13           x2             2025-11-05 14:09:39 -0500 EST   Up 29 minutes
x2-17           x2             2025-11-05 12:33:31 -0500 EST   Up 2 hours
x2-21           x2             2025-09-30 16:02:44 -0400 EDT   Up 4 days

root@nj1.sv5:~# docker ps --format "table {{.Names}}\t{{.Image}}\t{{.CreatedAt}}\t{{.Status}}" | sort
kafka-04         kafka     2025-09-08 12:55:40 -0400 EDT   Up 3 days
kafka-16         kafka     2025-11-05 12:33:28 -0500 EST   Up About an hour
NAMES            IMAGE     CREATED AT                      STATUS
rdp-12           rdp       2025-11-05 11:37:23 -0500 EST   Up 2 hours
rdp-4            rdp       2025-07-31 23:14:28 -0400 EDT   Up 3 days
rdp-5            rdp       2025-07-07 22:17:21 -0400 EDT   Up 3 days
user-alebedev    user      2025-10-02 23:58:04 -0400 EDT   Up 3 days
user-apolov      user      2025-10-02 23:58:04 -0400 EDT   Up 3 days
user-avorovich   user      2025-10-02 23:58:04 -0400 EDT   Up 3 days
user-vparizhs    user      2025-10-02 23:58:04 -0400 EDT   Up 3 days
x2-04            x2        2025-11-05 12:58:08 -0500 EST   Up 49 minutes
x2-08            x2        2025-10-30 11:42:23 -0400 EDT   Up 3 days
x2-16            x2        2025-11-05 09:19:38 -0500 EST   Up 4 hours
x2-20            x2        2025-11-05 12:33:33 -0500 EST   Up About an hour
x2-24            x2        2025-09-30 16:02:44 -0400 EDT   Up 3 days


$ x2node  -node:nj1.sn1.bm -root
root@nj1.sv1:~# docker ps --format "table {{.Names}}\t{{.Image}}\t{{.CreatedAt}}\t{{.Status}}" | sort
easyca-01         easyca          2025-08-05 19:50:43 -0400 EDT   Up 3 days
gitlab-main       gitlab          2025-10-03 17:06:07 -0400 EDT   Up 3 days (healthy)
gitlab-runner-5   gitlab-runner   2025-10-22 02:17:30 -0400 EDT   Up 3 days
gitlab-runner-6   gitlab-runner   2025-10-22 02:17:26 -0400 EDT   Up 3 days
kafkacw-01        kafkacw         2025-11-05 13:49:18 -0500 EST   Up About a minute
kafkacw-02        kafkacw         2025-11-05 12:33:33 -0500 EST   Up About an hour
kafkaui-1         kafkaui         2025-07-31 20:06:50 -0400 EDT   Up 3 days
kafkaui-2         kafkaui         2025-11-05 12:58:11 -0500 EST   Up 52 minutes
kafkaui-3         kafkaui         2025-11-05 11:37:25 -0500 EST   Up 2 hours
kafkaui-4         kafkaui         2025-11-05 13:49:18 -0500 EST   Up About a minute
kafkaui-5         kafkaui         2025-11-05 12:33:34 -0500 EST   Up About an hour
minio-01          minio           2025-11-05 13:49:18 -0500 EST   Up About a minute
minio-02          minio           2025-11-05 12:33:33 -0500 EST   Up About an hour
minio-main        8114eec3dcdb    2025-08-06 18:08:36 -0400 EDT   Up 3 days
NAMES             IMAGE           CREATED AT                      STATUS
rdpui-1           rdpui           2025-07-31 20:06:50 -0400 EDT   Up 3 days
rdpui-2           rdpui           2025-11-05 12:58:11 -0500 EST   Up 52 minutes
rdpui-3           rdpui           2025-11-05 13:49:18 -0500 EST   Up About a minute
rdpui-4           rdpui           2025-10-30 11:42:24 -0400 EDT   Up 3 days
rdpui-5           rdpui           2025-11-05 12:33:34 -0500 EST   Up About an hour
user-alebedev     3d5162883020    2025-09-19 14:29:18 -0400 EDT   Up 3 days
user-alexjedi     user            2025-10-06 08:30:34 -0400 EDT   Up 3 days
user-apolov       user            2025-10-07 06:16:07 -0400 EDT   Up 3 days
user-avorovich    3d5162883020    2025-09-10 16:07:00 -0400 EDT   Up 3 days
user-rnozdrin     3d5162883020    2025-09-15 09:14:37 -0400 EDT   Up 3 days
user-shared       3d5162883020    2025-09-08 18:37:46 -0400 EDT   Up 3 days
user-vparizhs     user            2025-10-20 08:53:53 -0400 EDT   Up 3 days
vault-1           vault           2025-08-28 00:33:55 -0400 EDT   Up 3 days
x2svc-1           x2svc           2025-11-05 07:01:57 -0500 EST   Up 7 hours
x2ui-1            x2ui            2025-11-05 12:58:11 -0500 EST   Up 52 minutes
x2ui-2            x2ui            2025-10-30 11:42:27 -0400 EDT   Up 3 days
x2ui-4            x2ui            2025-11-05 09:19:47 -0500 EST   Up 5 hours
x2ui-5            x2ui            2025-09-30 16:02:53 -0400 EDT   Up 3 days
x2w-01            x2w             2025-07-31 20:06:50 -0400 EDT   Up 3 days
x2w-02            x2w             2025-11-05 12:58:12 -0500 EST   Up 52 minutes
x2w-03            x2w             2025-11-05 11:37:25 -0500 EST   Up 2 hours
x2w-04            x2w             2025-09-30 16:02:45 -0400 EDT   Up 3 days
x2w-05            x2w             2025-10-30 11:42:24 -0400 EDT   Up 3 days
x2w-06            x2w             2025-11-05 09:19:41 -0500 EST   Up 5 hours
x2w-07            x2w             2025-11-05 13:49:18 -0500 EST   Up About a minute
x2w-08            x2w             2025-11-05 12:33:34 -0500 EST   Up About an hour
root@nj1.sv1:~# 