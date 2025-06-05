#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.CreateTopicsRspV7wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.CreateTopicsRspV7wrk timeout:10  memcheck:Y  exit_code:0  comment:CreateTopicsRspV7wrk
acr.insert  atfdb.targs comptest:kapi.CreateTopicsRspV7wrk args:"-decode -hex -pretty -rsp:- -apiver:3.19.7"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100000.in  istuple:N  msg:"00 00 05 0e 00 00 00 03 00 00 00 00 00 02 1b 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100010.in  istuple:N  msg:"30 2d 6f 57 70 76 64 51 4d d4 c8 ef 7b 86 84 4a 9f 97 52 6f d1 7b f1 f7 1d 00 00 00 00 00 00 0a"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100020.in  istuple:N  msg:"00 03 25 0f 63 6c 65 61 6e 75 70 2e 70 6f 6c 69 63 79 07 64 65 6c 65 74 65 00 05 00 00 17 63 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100030.in  istuple:N  msg:"6d 70 72 65 73 73 69 6f 6e 2e 67 7a 69 70 2e 6c 65 76 65 6c 03 2d 31 00 05 00 00 16 63 6f 6d 70"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100040.in  istuple:N  msg:"72 65 73 73 69 6f 6e 2e 6c 7a 34 2e 6c 65 76 65 6c 02 39 00 05 00 00 11 63 6f 6d 70 72 65 73 73"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100050.in  istuple:N  msg:"69 6f 6e 2e 74 79 70 65 09 70 72 6f 64 75 63 65 72 00 05 00 00 17 63 6f 6d 70 72 65 73 73 69 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100060.in  istuple:N  msg:"6e 2e 7a 73 74 64 2e 6c 65 76 65 6c 02 33 00 05 00 00 14 64 65 6c 65 74 65 2e 72 65 74 65 6e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100070.in  istuple:N  msg:"69 6f 6e 2e 6d 73 09 38 36 34 30 30 30 30 30 00 05 00 00 15 66 69 6c 65 2e 64 65 6c 65 74 65 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100080.in  istuple:N  msg:"64 65 6c 61 79 2e 6d 73 06 36 30 30 30 30 00 05 00 00 0f 66 6c 75 73 68 2e 6d 65 73 73 61 67 65"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100090.in  istuple:N  msg:"73 14 39 32 32 33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 00 05 00 00 09 66 6c 75 73 68 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100100.in  istuple:N  msg:"6d 73 14 39 32 32 33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 00 05 00 00 28 66 6f 6c 6c 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100110.in  istuple:N  msg:"77 65 72 2e 72 65 70 6c 69 63 61 74 69 6f 6e 2e 74 68 72 6f 74 74 6c 65 64 2e 72 65 70 6c 69 63"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100120.in  istuple:N  msg:"61 73 01 00 05 00 00 15 69 6e 64 65 78 2e 69 6e 74 65 72 76 61 6c 2e 62 79 74 65 73 05 34 30 39"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100130.in  istuple:N  msg:"36 00 05 00 00 26 6c 65 61 64 65 72 2e 72 65 70 6c 69 63 61 74 69 6f 6e 2e 74 68 72 6f 74 74 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100140.in  istuple:N  msg:"65 64 2e 72 65 70 6c 69 63 61 73 01 00 05 00 00 16 6c 6f 63 61 6c 2e 72 65 74 65 6e 74 69 6f 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100150.in  istuple:N  msg:"2e 62 79 74 65 73 03 2d 32 00 05 00 00 13 6c 6f 63 61 6c 2e 72 65 74 65 6e 74 69 6f 6e 2e 6d 73"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100160.in  istuple:N  msg:"03 2d 32 00 05 00 00 16 6d 61 78 2e 63 6f 6d 70 61 63 74 69 6f 6e 2e 6c 61 67 2e 6d 73 14 39 32"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100170.in  istuple:N  msg:"32 33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 00 05 00 00 12 6d 61 78 2e 6d 65 73 73 61 67"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100180.in  istuple:N  msg:"65 2e 62 79 74 65 73 09 31 30 34 38 35 37 36 30 00 04 00 00 1e 6d 65 73 73 61 67 65 2e 64 6f 77"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100190.in  istuple:N  msg:"6e 63 6f 6e 76 65 72 73 69 6f 6e 2e 65 6e 61 62 6c 65 05 74 72 75 65 00 05 00 00 17 6d 65 73 73"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100200.in  istuple:N  msg:"61 67 65 2e 66 6f 72 6d 61 74 2e 76 65 72 73 69 6f 6e 08 33 2e 30 2d 49 56 31 00 05 00 00 1f 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100210.in  istuple:N  msg:"65 73 73 61 67 65 2e 74 69 6d 65 73 74 61 6d 70 2e 61 66 74 65 72 2e 6d 61 78 2e 6d 73 14 39 32"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100220.in  istuple:N  msg:"32 33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 00 05 00 00 20 6d 65 73 73 61 67 65 2e 74 69"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100230.in  istuple:N  msg:"6d 65 73 74 61 6d 70 2e 62 65 66 6f 72 65 2e 6d 61 78 2e 6d 73 14 39 32 32 33 33 37 32 30 33 36"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100240.in  istuple:N  msg:"38 35 34 37 37 35 38 30 37 00 05 00 00 24 6d 65 73 73 61 67 65 2e 74 69 6d 65 73 74 61 6d 70 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100250.in  istuple:N  msg:"64 69 66 66 65 72 65 6e 63 65 2e 6d 61 78 2e 6d 73 14 39 32 32 33 33 37 32 30 33 36 38 35 34 37"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100260.in  istuple:N  msg:"37 35 38 30 37 00 05 00 00 17 6d 65 73 73 61 67 65 2e 74 69 6d 65 73 74 61 6d 70 2e 74 79 70 65"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100270.in  istuple:N  msg:"0b 43 72 65 61 74 65 54 69 6d 65 00 05 00 00 1a 6d 69 6e 2e 63 6c 65 61 6e 61 62 6c 65 2e 64 69"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100280.in  istuple:N  msg:"72 74 79 2e 72 61 74 69 6f 04 30 2e 35 00 05 00 00 16 6d 69 6e 2e 63 6f 6d 70 61 63 74 69 6f 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100290.in  istuple:N  msg:"2e 6c 61 67 2e 6d 73 02 30 00 05 00 00 14 6d 69 6e 2e 69 6e 73 79 6e 63 2e 72 65 70 6c 69 63 61"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100300.in  istuple:N  msg:"73 02 32 00 01 00 00 0c 70 72 65 61 6c 6c 6f 63 61 74 65 06 66 61 6c 73 65 00 05 00 00 18 72 65"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100310.in  istuple:N  msg:"6d 6f 74 65 2e 6c 6f 67 2e 63 6f 70 79 2e 64 69 73 61 62 6c 65 06 66 61 6c 73 65 00 05 00 00 1d"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100320.in  istuple:N  msg:"72 65 6d 6f 74 65 2e 6c 6f 67 2e 64 65 6c 65 74 65 2e 6f 6e 2e 64 69 73 61 62 6c 65 06 66 61 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100330.in  istuple:N  msg:"73 65 00 05 00 00 16 72 65 6d 6f 74 65 2e 73 74 6f 72 61 67 65 2e 65 6e 61 62 6c 65 06 66 61 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100340.in  istuple:N  msg:"73 65 00 05 00 00 10 72 65 74 65 6e 74 69 6f 6e 2e 62 79 74 65 73 03 2d 31 00 05 00 00 0d 72 65"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100350.in  istuple:N  msg:"74 65 6e 74 69 6f 6e 2e 6d 73 0a 36 30 34 38 30 30 30 30 30 00 04 00 00 0e 73 65 67 6d 65 6e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100360.in  istuple:N  msg:"2e 62 79 74 65 73 0b 31 30 37 33 37 34 31 38 32 34 00 04 00 00 14 73 65 67 6d 65 6e 74 2e 69 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100370.in  istuple:N  msg:"64 65 78 2e 62 79 74 65 73 09 31 30 34 38 35 37 36 30 00 05 00 00 12 73 65 67 6d 65 6e 74 2e 6a"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100380.in  istuple:N  msg:"69 74 74 65 72 2e 6d 73 02 30 00 05 00 00 0b 73 65 67 6d 65 6e 74 2e 6d 73 0a 36 30 34 38 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100390.in  istuple:N  msg:"30 30 30 00 05 00 00 1f 75 6e 63 6c 65 61 6e 2e 6c 65 61 64 65 72 2e 65 6c 65 63 74 69 6f 6e 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsRspV7wrk/100400.in  istuple:N  msg:"65 6e 61 62 6c 65 06 66 61 6c 73 65 00 05 00 00 00 00"
EOF
atf_comp -capture kapi.CreateTopicsRspV7wrk
atf_comp -run     kapi.CreateTopicsRspV7wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.CreateTopicsResponse  request_api_version:7  correlation_id:3  throttle_time_ms:0  topics.0:'kafka2.CreatableTopicResult19a  name:test-topic-0000000-oWpvdQM  topic_id:d4c8ef7b-8684-4a9f-9752-6fd17bf1f71d  error_code:0  num_partitions:10  replication_factor:3  configs.0:"kafka2.CreatableTopicConfigs19a  name:cleanup.policy  value:delete  read_only:N  config_source:5  is_sensitive:N"  configs.1:"kafka2.CreatableTopicConfigs19a  name:compression.gzip.level  value:-1  read_only:N  config_source:5  is_sensitive:N"  configs.2:"kafka2.CreatableTopicConfigs19a  name:compression.lz4.level  value:9  read_only:N  config_source:5  is_sensitive:N"  configs.3:"kafka2.CreatableTopicConfigs19a  name:compression.type  value:producer  read_only:N  config_source:5  is_sensitive:N"  configs.4:"kafka2.CreatableTopicConfigs19a  name:compression.zstd.level  value:3  read_only:N  config_source:5  is_sensitive:N"  configs.5:"kafka2.CreatableTopicConfigs19a  name:delete.retention.ms  value:86400000  read_only:N  config_source:5  is_sensitive:N"  configs.6:"kafka2.CreatableTopicConfigs19a  name:file.delete.delay.ms  value:60000  read_only:N  config_source:5  is_sensitive:N"  configs.7:"kafka2.CreatableTopicConfigs19a  name:flush.messages  value:9223372036854775807  read_only:N  config_source:5  is_sensitive:N"  configs.8:"kafka2.CreatableTopicConfigs19a  name:flush.ms  value:9223372036854775807  read_only:N  config_source:5  is_sensitive:N"  configs.9:\'kafka2.CreatableTopicConfigs19a  name:follower.replication.throttled.replicas  value:""  read_only:N  config_source:5  is_sensitive:N\'  configs.10:"kafka2.CreatableTopicConfigs19a  name:index.interval.bytes  value:4096  read_only:N  config_source:5  is_sensitive:N"  configs.11:\'kafka2.CreatableTopicConfigs19a  name:leader.replication.throttled.replicas  value:""  read_only:N  config_source:5  is_sensitive:N\'  configs.12:"kafka2.CreatableTopicConfigs19a  name:local.retention.bytes  value:-2  read_only:N  config_source:5  is_sensitive:N"  configs.13:"kafka2.CreatableTopicConfigs19a  name:local.retention.ms  value:-2  read_only:N  config_source:5  is_sensitive:N"  configs.14:"kafka2.CreatableTopicConfigs19a  name:max.compaction.lag.ms  value:9223372036854775807  read_only:N  config_source:5  is_sensitive:N"  configs.15:"kafka2.CreatableTopicConfigs19a  name:max.message.bytes  value:10485760  read_only:N  config_source:4  is_sensitive:N"  configs.16:"kafka2.CreatableTopicConfigs19a  name:message.downconversion.enable  value:true  read_only:N  config_source:5  is_sensitive:N"  configs.17:"kafka2.CreatableTopicConfigs19a  name:message.format.version  value:3.0-IV1  read_only:N  config_source:5  is_sensitive:N"  configs.18:"kafka2.CreatableTopicConfigs19a  name:message.timestamp.after.max.ms  value:9223372036854775807  read_only:N  config_source:5  is_sensitive:N"  configs.19:"kafka2.CreatableTopicConfigs19a  name:message.timestamp.before.max.ms  value:9223372036854775807  read_only:N  config_source:5  is_sensitive:N"  configs.20:"kafka2.CreatableTopicConfigs19a  name:message.timestamp.difference.max.ms  value:9223372036854775807  read_only:N  config_source:5  is_sensitive:N"  configs.21:"kafka2.CreatableTopicConfigs19a  name:message.timestamp.type  value:CreateTime  read_only:N  config_source:5  is_sensitive:N"  configs.22:"kafka2.CreatableTopicConfigs19a  name:min.cleanable.dirty.ratio  value:0.5  read_only:N  config_source:5  is_sensitive:N"  configs.23:"kafka2.CreatableTopicConfigs19a  name:min.compaction.lag.ms  value:0  read_only:N  config_source:5  is_sensitive:N"  configs.24:"kafka2.CreatableTopicConfigs19a  name:min.insync.replicas  value:2  read_only:N  config_source:1  is_sensitive:N"  configs.25:"kafka2.CreatableTopicConfigs19a  name:preallocate  value:false  read_only:N  config_source:5  is_sensitive:N"  configs.26:"kafka2.CreatableTopicConfigs19a  name:remote.log.copy.disable  value:false  read_only:N  config_source:5  is_sensitive:N"  configs.27:"kafka2.CreatableTopicConfigs19a  name:remote.log.delete.on.disable  value:false  read_only:N  config_source:5  is_sensitive:N"  configs.28:"kafka2.CreatableTopicConfigs19a  name:remote.storage.enable  value:false  read_only:N  config_source:5  is_sensitive:N"  configs.29:"kafka2.CreatableTopicConfigs19a  name:retention.bytes  value:-1  read_only:N  config_source:5  is_sensitive:N"  configs.30:"kafka2.CreatableTopicConfigs19a  name:retention.ms  value:604800000  read_only:N  config_source:4  is_sensitive:N"  configs.31:"kafka2.CreatableTopicConfigs19a  name:segment.bytes  value:1073741824  read_only:N  config_source:4  is_sensitive:N"  configs.32:"kafka2.CreatableTopicConfigs19a  name:segment.index.bytes  value:10485760  read_only:N  config_source:5  is_sensitive:N"  configs.33:"kafka2.CreatableTopicConfigs19a  name:segment.jitter.ms  value:0  read_only:N  config_source:5  is_sensitive:N"  configs.34:"kafka2.CreatableTopicConfigs19a  name:segment.ms  value:604800000  read_only:N  config_source:5  is_sensitive:N"  configs.35:"kafka2.CreatableTopicConfigs19a  name:unclean.leader.election.enable  value:false  read_only:N  config_source:5  is_sensitive:N"'
# kafka2.CreateTopicsResponse
request_api_version:7
correlation_id:3
throttle_time_ms:0
topics.0
  kafka2.CreatableTopicResult19a
  name:test-topic-0000000-oWpvdQM
  topic_id:d4c8ef7b-8684-4a9f-9752-6fd17bf1f71d
  error_code:0
  num_partitions:10
  replication_factor:3
  configs.0
    kafka2.CreatableTopicConfigs19a
    name:cleanup.policy
    value:delete
    read_only:N
    config_source:5
    is_sensitive:N
  configs.1
    kafka2.CreatableTopicConfigs19a
    name:compression.gzip.level
    value:-1
    read_only:N
    config_source:5
    is_sensitive:N
  configs.2
    kafka2.CreatableTopicConfigs19a
    name:compression.lz4.level
    value:9
    read_only:N
    config_source:5
    is_sensitive:N
  configs.3
    kafka2.CreatableTopicConfigs19a
    name:compression.type
    value:producer
    read_only:N
    config_source:5
    is_sensitive:N
  configs.4
    kafka2.CreatableTopicConfigs19a
    name:compression.zstd.level
    value:3
    read_only:N
    config_source:5
    is_sensitive:N
  configs.5
    kafka2.CreatableTopicConfigs19a
    name:delete.retention.ms
    value:86400000
    read_only:N
    config_source:5
    is_sensitive:N
  configs.6
    kafka2.CreatableTopicConfigs19a
    name:file.delete.delay.ms
    value:60000
    read_only:N
    config_source:5
    is_sensitive:N
  configs.7
    kafka2.CreatableTopicConfigs19a
    name:flush.messages
    value:9223372036854775807
    read_only:N
    config_source:5
    is_sensitive:N
  configs.8
    kafka2.CreatableTopicConfigs19a
    name:flush.ms
    value:9223372036854775807
    read_only:N
    config_source:5
    is_sensitive:N
  configs.9
    kafka2.CreatableTopicConfigs19a
    name:follower.replication.throttled.replicas
    value:""
    read_only:N
    config_source:5
    is_sensitive:N
  configs.10
    kafka2.CreatableTopicConfigs19a
    name:index.interval.bytes
    value:4096
    read_only:N
    config_source:5
    is_sensitive:N
  configs.11
    kafka2.CreatableTopicConfigs19a
    name:leader.replication.throttled.replicas
    value:""
    read_only:N
    config_source:5
    is_sensitive:N
  configs.12
    kafka2.CreatableTopicConfigs19a
    name:local.retention.bytes
    value:-2
    read_only:N
    config_source:5
    is_sensitive:N
  configs.13
    kafka2.CreatableTopicConfigs19a
    name:local.retention.ms
    value:-2
    read_only:N
    config_source:5
    is_sensitive:N
  configs.14
    kafka2.CreatableTopicConfigs19a
    name:max.compaction.lag.ms
    value:9223372036854775807
    read_only:N
    config_source:5
    is_sensitive:N
  configs.15
    kafka2.CreatableTopicConfigs19a
    name:max.message.bytes
    value:10485760
    read_only:N
    config_source:4
    is_sensitive:N
  configs.16
    kafka2.CreatableTopicConfigs19a
    name:message.downconversion.enable
    value:true
    read_only:N
    config_source:5
    is_sensitive:N
  configs.17
    kafka2.CreatableTopicConfigs19a
    name:message.format.version
    value:3.0-IV1
    read_only:N
    config_source:5
    is_sensitive:N
  configs.18
    kafka2.CreatableTopicConfigs19a
    name:message.timestamp.after.max.ms
    value:9223372036854775807
    read_only:N
    config_source:5
    is_sensitive:N
  configs.19
    kafka2.CreatableTopicConfigs19a
    name:message.timestamp.before.max.ms
    value:9223372036854775807
    read_only:N
    config_source:5
    is_sensitive:N
  configs.20
    kafka2.CreatableTopicConfigs19a
    name:message.timestamp.difference.max.ms
    value:9223372036854775807
    read_only:N
    config_source:5
    is_sensitive:N
  configs.21
    kafka2.CreatableTopicConfigs19a
    name:message.timestamp.type
    value:CreateTime
    read_only:N
    config_source:5
    is_sensitive:N
  configs.22
    kafka2.CreatableTopicConfigs19a
    name:min.cleanable.dirty.ratio
    value:0.5
    read_only:N
    config_source:5
    is_sensitive:N
  configs.23
    kafka2.CreatableTopicConfigs19a
    name:min.compaction.lag.ms
    value:0
    read_only:N
    config_source:5
    is_sensitive:N
  configs.24
    kafka2.CreatableTopicConfigs19a
    name:min.insync.replicas
    value:2
    read_only:N
    config_source:1
    is_sensitive:N
  configs.25
    kafka2.CreatableTopicConfigs19a
    name:preallocate
    value:false
    read_only:N
    config_source:5
    is_sensitive:N
  configs.26
    kafka2.CreatableTopicConfigs19a
    name:remote.log.copy.disable
    value:false
    read_only:N
    config_source:5
    is_sensitive:N
  configs.27
    kafka2.CreatableTopicConfigs19a
    name:remote.log.delete.on.disable
    value:false
    read_only:N
    config_source:5
    is_sensitive:N
  configs.28
    kafka2.CreatableTopicConfigs19a
    name:remote.storage.enable
    value:false
    read_only:N
    config_source:5
    is_sensitive:N
  configs.29
    kafka2.CreatableTopicConfigs19a
    name:retention.bytes
    value:-1
    read_only:N
    config_source:5
    is_sensitive:N
  configs.30
    kafka2.CreatableTopicConfigs19a
    name:retention.ms
    value:604800000
    read_only:N
    config_source:4
    is_sensitive:N
  configs.31
    kafka2.CreatableTopicConfigs19a
    name:segment.bytes
    value:1073741824
    read_only:N
    config_source:4
    is_sensitive:N
  configs.32
    kafka2.CreatableTopicConfigs19a
    name:segment.index.bytes
    value:10485760
    read_only:N
    config_source:5
    is_sensitive:N
  configs.33
    kafka2.CreatableTopicConfigs19a
    name:segment.jitter.ms
    value:0
    read_only:N
    config_source:5
    is_sensitive:N
  configs.34
    kafka2.CreatableTopicConfigs19a
    name:segment.ms
    value:604800000
    read_only:N
    config_source:5
    is_sensitive:N
  configs.35
    kafka2.CreatableTopicConfigs19a
    name:unclean.leader.election.enable
    value:false
    read_only:N
    config_source:5
    is_sensitive:N

