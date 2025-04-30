#!/bin/bash
kapi -decode  -msgdir ../pcap/cap2
 kapi -decode  -req:/home/avorovich/pcap/cap/108.1-108.2_0000_Metadata_req.kafka   -echo
 kapi -decode  -req:../pcap/cap/108.1-108.2_0000_Metadata_req.kafka -rsp_auto:true  