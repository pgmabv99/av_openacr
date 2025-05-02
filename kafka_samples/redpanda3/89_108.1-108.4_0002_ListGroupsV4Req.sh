#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.ListGroupsReqV4rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.ListGroupsReqV4rdp timeout:10  memcheck:Y  exit_code:0  comment:ListGroupsReqV4rdp
acr.insert  atfdb.targs comptest:kapi.ListGroupsReqV4rdp args:"-decode -hex -req:- "
acr.insert  atfdb.tmsg  tmsg:kapi.ListGroupsReqV4rdp/100000.in  istuple:N  msg:"00 00 00 1d 00 10 00 04 00 00 00 02 00 10 72 65 64 70 61 6e 64 61 2d 63 6f 6e 73 6f 6c 65 00 01  "
acr.insert  atfdb.tmsg  tmsg:kapi.ListGroupsReqV4rdp/100010.in  istuple:N  msg:"00 "
EOF
atf_comp -capture kapi.ListGroupsReqV4rdp
atf_comp -run     kapi.ListGroupsReqV4rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.ListGroupsRequest  request_api_version:4  correlation_id:2  client_id:redpanda-console
