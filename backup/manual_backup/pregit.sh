#!/bin/bash
set -x
set -e
cd $HOME/openacr
# save the driver cpp as the genration creates a new one
cp  ~/openacr/cpp/myns/myns.cpp ~/openacrav/backup/myns.cpp