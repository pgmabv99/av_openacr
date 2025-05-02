#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeConfigsRspV3rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeConfigsRspV3rdp timeout:10  memcheck:Y  exit_code:0  comment:DescribeConfigsRspV3rdp
acr.insert  atfdb.targs comptest:kapi.DescribeConfigsRspV3rdp args:"-decode -hex -rsp:- -apiver:18.32.3"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100000.in  istuple:N  msg:"00 00 02 93 00 00 00 12 00 00 00 00 00 00 00 01 00 00 00 00 02 00 03 61 76 31 00 00 00 01 00 0e  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100010.in  istuple:N  msg:"63 6c 65 61 6e 75 70 2e 70 6f 6c 69 63 79 00 06 64 65 6c 65 74 65 00 01 00 00 00 00 02 00 0e 63  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100020.in  istuple:N  msg:"6c 65 61 6e 75 70 2e 70 6f 6c 69 63 79 00 06 64 65 6c 65 74 65 01 00 12 6c 6f 67 2e 63 6c 65 61  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100030.in  istuple:N  msg:"6e 75 70 2e 70 6f 6c 69 63 79 00 06 64 65 6c 65 74 65 05 07 02 21 54 68 69 73 20 63 6f 6e 66 69  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100040.in  istuple:N  msg:"67 20 64 65 73 69 67 6e 61 74 65 73 20 74 68 65 20 72 65 74 65 6e 74 69 6f 6e 20 70 6f 6c 69 63  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100050.in  istuple:N  msg:"79 20 74 6f 20 75 73 65 20 6f 6e 20 6c 6f 67 20 73 65 67 6d 65 6e 74 73 2e 20 54 68 65 20 22 64  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100060.in  istuple:N  msg:"65 6c 65 74 65 22 20 70 6f 6c 69 63 79 20 28 77 68 69 63 68 20 69 73 20 74 68 65 20 64 65 66 61  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100070.in  istuple:N  msg:"75 6c 74 29 20 77 69 6c 6c 20 64 69 73 63 61 72 64 20 6f 6c 64 20 73 65 67 6d 65 6e 74 73 20 77  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100080.in  istuple:N  msg:"68 65 6e 20 74 68 65 69 72 20 72 65 74 65 6e 74 69 6f 6e 20 74 69 6d 65 20 6f 72 20 73 69 7a 65  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100090.in  istuple:N  msg:"20 6c 69 6d 69 74 20 68 61 73 20 62 65 65 6e 20 72 65 61 63 68 65 64 2e 20 54 68 65 20 22 63 6f  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100100.in  istuple:N  msg:"6d 70 61 63 74 22 20 70 6f 6c 69 63 79 20 77 69 6c 6c 20 65 6e 61 62 6c 65 20 3c 61 20 68 72 65  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100110.in  istuple:N  msg:"66 3d 22 23 63 6f 6d 70 61 63 74 69 6f 6e 22 3e 6c 6f 67 20 63 6f 6d 70 61 63 74 69 6f 6e 3c 2f  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100120.in  istuple:N  msg:"61 3e 2c 20 77 68 69 63 68 20 72 65 74 61 69 6e 73 20 74 68 65 20 6c 61 74 65 73 74 20 76 61 6c  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100130.in  istuple:N  msg:"75 65 20 66 6f 72 20 65 61 63 68 20 6b 65 79 2e 20 49 74 20 69 73 20 61 6c 73 6f 20 70 6f 73 73  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100140.in  istuple:N  msg:"69 62 6c 65 20 74 6f 20 73 70 65 63 69 66 79 20 62 6f 74 68 20 70 6f 6c 69 63 69 65 73 20 69 6e  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100150.in  istuple:N  msg:"20 61 20 63 6f 6d 6d 61 2d 73 65 70 61 72 61 74 65 64 20 6c 69 73 74 20 28 65 2e 67 2e 20 22 64  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100160.in  istuple:N  msg:"65 6c 65 74 65 2c 63 6f 6d 70 61 63 74 22 29 2e 20 49 6e 20 74 68 69 73 20 63 61 73 65 2c 20 6f  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100170.in  istuple:N  msg:"6c 64 20 73 65 67 6d 65 6e 74 73 20 77 69 6c 6c 20 62 65 20 64 69 73 63 61 72 64 65 64 20 70 65  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100180.in  istuple:N  msg:"72 20 74 68 65 20 72 65 74 65 6e 74 69 6f 6e 20 74 69 6d 65 20 61 6e 64 20 73 69 7a 65 20 63 6f  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100190.in  istuple:N  msg:"6e 66 69 67 75 72 61 74 69 6f 6e 2c 20 77 68 69 6c 65 20 72 65 74 61 69 6e 65 64 20 73 65 67 6d  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100200.in  istuple:N  msg:"65 6e 74 73 20 77 69 6c 6c 20 62 65 20 63 6f 6d 70 61 63 74 65 64 2e "
EOF
atf_comp -capture kapi.DescribeConfigsRspV3rdp
atf_comp -run     kapi.DescribeConfigsRspV3rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeConfigsResponse  request_api_version:3  correlation_id:18  throttle_time_ms:0  results.0:'kafka2.DescribeConfigsResult32a  error_code:0  error_message:""  resource_type:2  resource_name:av1  configs.0:\'kafka2.DescribeConfigsResourceResult32a  name:cleanup.policy  value:delete  read_only:N  config_source:1  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:cleanup.policy  value:delete  source:1"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:log.cleanup.policy  value:delete  source:5"  config_type:7  documentation:\\\'This config designates the retention policy to use on log segments. The "delete" policy (which is the default) will discard old segments when their retention time or size limit has been reached. The "compact" policy will enable <a href="#compaction">log compaction</a>, which retains the latest value for each key. It is also possible to specify both policies in a comma-separated list (e.g. "delete,compact"). In this case, old segments will be discarded per the retention time and size configuration, while retained segments will be compacted.\\\'\''
