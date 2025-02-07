#!/bin/bash
set -x -e
cd $HOME
if [ -d "dpdk" ]; then
    rm -rf dpdk
fi
git clone https://github.com/DPDK/dpdk.git
cd dpdk
meson setup build --wipe > $HOME/av_openacr/meson_setup.log
meson configure build -Dexamples=dumpcap >> $HOME/av_openacr/meson_setup.log
# meson build
ninja -C build >> $HOME/av_openacr/meson_setup.log
# sudo ninja -C build install