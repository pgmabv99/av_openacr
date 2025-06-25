#!/bin/bash



tempdir=temp/atf_comp/atf_x2.KafkaCreateTopic
ofile=~/av_openacr/x2sup_logs/x2sup.log

rm -rf x2data-0-0
x2fs -path:x2data-0-0/ -create -f 
echo "Output file: $ofile"
x2sup -i -v -v > $ofile 2>&1

exit





kcat -b 127.0.0.1:$kafkaport -L -t test1 -X allow.auto.create.topics=false
kcat -b 127.0.0.1:$kafkaport -L


atf_comp atf_x2.KafkaDescribeCluster  -run -capture -check_untracked:N
atf_comp atf_x2.KafkaDescribeCluster  -capture -check_untracked:N
x2.ProcMsg  proc:kapi  payload:"kafka2.CreateTopicsRequest  request_api_version:7  topics.0:'kafka2.CreatableTopic19q  name:test7  num_partitions:3  replication_factor:1'"
x2.ProcMsg  proc:kapi  payload:"kafka2.DescribeClusterRequest  request_api_version:0  correlation_id:3  client_id:kafka-ui-admin-1746648345-1  include_cluster_authorized_operations:N  endpoint_type:1  include_fenced_brokers:N"

kafka2.DescribeClusterRequest  request_api_version:0  correlation_id:3  client_id:kafka-ui-admin-1746648345-1  include_cluster_authorized_operations:N  endpoint_type:1  include_fenced_brokers:N


 echo 'kafka2.MetadataRequest request_api_version:3' | kapi -connect -pretty
 echo 'kafka2.DescribeClusterRequest request_api_version:0' | kapi -connect -pretty
 echo 'kafka2.DescribeConfigsRequest  request_api_version:4  correlation_id:5  client_id:kafka-ui-admin-1746648386-1  resources.0:"kafka2.DescribeConfigsResource32q  resource_type:4  resource_name:1"  include_synonyms:N  include_documentation:N' | kapi -connect -pretty