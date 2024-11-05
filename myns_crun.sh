#!/bin/bash
set -x
cd $HOME/openacr

echo "install driver cpp"
cp conf/myns_driver.cpp cpp/myns/myns.cpp

echo "backup  driver cpp"
cp  cpp/myns/myns.cpp ~/openacrav/myns_driver.cpp
ai myns
myns