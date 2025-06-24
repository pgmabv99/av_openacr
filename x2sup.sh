#!/bin/bash


tag="test1"
tempdir=temp/atf_comp/atf_x2.KafkaCreateTopic
ofile=~/av_openacr/x2sup_logs/x2sup_$tag.log
echo "Output file: $ofile"
x2sup -i -in:$tempdir/data -v -v > $ofile 2>&1

exit



 sed -i 's/hbtimeout:30/hbtimeout:10000/g' data/x2db/proc.ssim

$ kcat -b 127.0.0.1:$kafkaport -L -t test1 -X allow.auto.create.topics=false
Metadata for test1 (from broker -1: 127.0.0.1:9092/bootstrap):
 0 brokers:
 1 topics:
  topic "test1" with 0 partitions: Broker: Unknown topic or partition
[0 Jun 21 18:15:20] x2usr@dev.x2-17:~/arnd 
$ kcat -b 127.0.0.1:$kafkaport -L
% ERROR: Failed to acquire metadata: Local: Timed out


atf_comp atf_x2.KafkaCreateTopic  -run


atf_comp atf_x2.KafkaDescribeCluster  -capture

atf_ci  -citest:atf_x2.KafkaDescribeCluster  -capture


x2.ProcMsg  proc:kapi  payload:"kafka2.CreateTopicsRequest  request_api_version:7  topics.0:'kafka2.CreatableTopic19q  name:test7  num_partitions:3  replication_factor:1'"
x2.ProcMsg  proc:kapi  payload:"kafka2.DescribeClusterRequest  request_api_version:0  correlation_id:3  client_id:kafka-ui-admin-1746648345-1  include_cluster_authorized_operations:N  endpoint_type:1  include_fenced_brokers:N"

kafka2.DescribeClusterRequest  request_api_version:0  correlation_id:3  client_id:kafka-ui-admin-1746648345-1  include_cluster_authorized_operations:N  endpoint_type:1  include_fenced_brokers:N

 echo 'kafka2.MetadataRequest request_api_version:3' | kapi -connect -pretty
 echo 'kafka2.DescribeClusterRequest request_api_version:0' | kapi -connect -pretty