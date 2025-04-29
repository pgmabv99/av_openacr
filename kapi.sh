#!/bin/bash
kapi -decode  -msgdir ../pcap/cap2
 kapi -decode  -req:../pcap/cap/108.1-108.2_0000_ApiVersions_req.kafka -echo