#!/bin/bash
MetadataRequestV3rdp
atf_comp -e kapi.DecodeApiVersionsRequestV3rdp

test=kapi.MetadataReqV9Rdp
test=kapi.MetadataRspV9Rdp
atf_comp -e $test
atf_comp -capture  $test
atf_comp -run   $test
acr % -check -x
git-add-to-last-commit

MetadataV9Req

kapi -decode -hex -echo -req:/home/avorovich/av_openacr/108.1-108.2_0000_MetadataV9Req  
kapi -decode -hex -echo -rsp:/home/avorovich/av_openacr/108.1-108.2_0000_MetadataV9Rsp  -apiver:9
kapi -decode -hex -echo -rsp:/home/avorovich/av_openacr/108.1-108.2_0000_MetadataV9Rsp  -apiver:0.3.9

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeLogDirsRspV2Rdp 
EOF
atf_comp -capture kapi.DescribeLogDirsRspV2Rdp
atf_comp -run     kapi.DescribeLogDirsRspV2Rdp