#!/bin/bash
# run x2sup  
echo "==kill previous x2sup and tcpdump"
pkill x2sup
sudo pkill tcpdump
rm -rf temp/x2tmp
rm core.*
trace=on
trace=off
echo "==start new x2sup "
# x2sup -initdir:temp/x2tmp/   -temp -livecheck:N -trace:'verbose:kafka2.%,timestamps'
# x2sup -initdir:temp/x2tmp/ -daemon  -temp  -livecheck:N  -trace:'verbose:kafka2.%,x2net.%,timestamps'
# x2sup -initdir:temp/x2tmp/ -daemon  -temp  -livecheck:N -proc:dev1p.x2sup-0-0 -trace:'verbose:kafka2.%, timestamps'
if [ "$trace" == "on" ]; then
    echo "tracing is ON"
    x2sup -initdir:temp/x2tmp/ -daemon  -temp  -livecheck:N -proc:dev1p.x2sup-0-0 -trace:'verbose:kafka2.%,x2net.%,x2cmt.%, timestamps'
else
    echo "tracing is OFF"
    x2sup -initdir:temp/x2tmp/ -daemon  -temp   -proc:dev1p.x2sup-0-0
fi
# sleep 1
# lsof -Pan -p $(pidof x2gw) -i
