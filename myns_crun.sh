#!/bin/bash
set -x
cd $HOME/openacr

echo "install driver cpp"
cp conf/myns_driver.cpp cpp/myns/myns.cpp

echo "backup  driver cpp"
cp  cpp/myns/myns.cpp ~/openacrav/myns_driver.cpp
# rm bin/myns  #it seems one cannot remove the binary at all. then ai skips ??
ai myns
myns