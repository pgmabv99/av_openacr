#!/bin/bash
# get spdk/dpdk/meson and build them 
set -e -x
cd $HOME    
rm -rf $HOME/rdma-core
git clone https://github.com/linux-rdma/rdma-core.git
cp $HOME/av_openacr/s_build_rdma.sh $HOME/rdma-core/build.sh
cd $HOME/rdma-core
./build.sh > $HOME/av_openacr/sniffer_logs/build_rdma.log 2>&1