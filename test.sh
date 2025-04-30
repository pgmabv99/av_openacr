#!/bin/bash
MetadataRequestV3rdp
atf_comp -e kapi.DecodeApiVersionsRequestV3rdp

test=kapi.MetadataReqV9Rdp
test=kapi.MetadataRspV9Rdp
atf_comp -e $test
atf_comp -capture  $test
atf_comp -run   $test

kapi -decode -hex -echo -req:/home/avorovich/av_openacr/108.1-108.2_0000_MetadataV9Req  
kapi -decode -hex -echo -rsp:/home/avorovich/av_openacr/108.1-108.2_0000_MetadataV9Rsp  -apiver:9
kapi -decode -hex -echo -rsp:/home/avorovich/av_openacr/108.1-108.2_0000_MetadataV9Rsp  -apiver:0.3.9
