#!/bin/bash
set -x

# pkill -f x2sup
# rm -rf temp/x2sup
# x2sup -temp    -livecheck:N 
# exit
rm -rf temp/x2sup*


# pkill x2sup
# rm -rf temp/x2sup22
# x2fs -create -path temp/x2sup22/ -topo:dev2 -f -local # MUST HAVE -LOCAL
# x2sup -initdir:temp/x2sup22/  -proc:dev2.x2sup-0-0 -daemon
# rm -rf temp/x2sup33
# x2fs -create -path temp/x2sup33/ -topo:dev2 -f -local # MUST HAVE -LOCAL
# x2sup -initdir:temp/x2sup33/  -proc:dev2.x2sup-1-0 -daemon
# exit 

pkill x2sup
rm -rf temp/x2sup22
x2sup -initdir:temp/x2sup22/  -proc:dev2.x2sup-0-0 -daemon  -temp 
exit 

pkill -f x2sup
# run_x2sup_with_id() {
#   local id="$1"
#   rm -rf "temp/$id"
#   mkdir -p "temp/$id"
#   x2sup -initdir:"temp/$id" -daemon -random_ports
# }

# run_x2sup_with_id "id1"
# run_x2sup_with_id "id2"

# x2sup -temp  -trace:'verbose:(kafka2.%|x2gw.%),timestamps'  -daemon -random_ports
# valgrind --log-file=temp/valgrind.log x2sup -temp  -trace:'verbose:(kafka2.%|x2gw.%),timestamps'  -daemon
# ofile=~/av_openacr/x2sup_logs/x2sup.log
# ofile_pretty=~/av_openacr/x2sup_logs/x2sup_pretty.log
# echo "Output file: $ofile"
# x2sup -temp   -trace:'verbose:(kafka2.%|x2gw.%),timestamps' > $ofile 2>&1
# x2sup -temp   -trace:'verbose:(kafka2.%|x2gw.%),timestamps' > $ofile 2>&1
# echo "x2sup output written to $ofile"


# x2sup_pretty.sh $ofile $ofile_pretty


# x2sup -i -temp   -v -v > $ofile 2>&1
# x2sup -i -temp   -trace:'verbose:(kafka2.%|x2gw.%group%),timestamps' > $ofile 2>&1
# vscode_setup x2sup --  -i -temp -trace:verbose:kafka2.%,timestamps
# x2sup -livecheck:N


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

