#!/bin/bash
set -x -e
cd $HOME
if [ -d "dpdkcap" ]; then
    rm -rf dpdkcap
fi
git clone https://github.com/dpdkcap/dpdkcap.git
cd dpdkcap
export RTE_SDK=$HOME/dpdk
export RTE_TARGET=x86_64-native-linuxapp-gcc
make