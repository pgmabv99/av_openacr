#!/bin/bash


ofile=~/av_openacr/x2sup_logs/x2sup.log

rm -rf x2data-0-0
x2fs -path:x2data-0-0/ -create -f 
echo "Output file: $ofile"
x2sup -i -v -v > $ofile 2>&1

exit




# sample clients
kcat -b 127.0.0.1:$kafkaport -L -t test1 -X allow.auto.create.topics=false
kcat -b 127.0.0.1:$kafkaport -L


# sample tests
 echo 'kafka2.MetadataRequest request_api_version:3' | kapi -connect -pretty
 echo 'kafka2.DescribeClusterRequest request_api_version:0' | kapi -connect -pretty
 echo 'kafka2.DescribeConfigsRequest  request_api_version:4  correlation_id:5  client_id:kafka-ui-admin-1746648386-1  resources.0:"kafka2.DescribeConfigsResource32q  resource_type:4  resource_name:1"  include_synonyms:N  include_documentation:N' | \
  kapi -connect -pretty

atf_comp atf_x2.KafkaDescribeCluster  -run  -check_untracked:N
atf_comp atf_x2.KafkaDescribeCluster  -capture -check_untracked:N

