#!/bin/bash
# run x2sup  

function wait_for_x2 {
    local max_tries=5
    i=0
    while ((i++<max_tries)); do
        grep READY_FOR_TEST temp/x2tmp/dev1p.x2sup-0-0.log && { return 0; }
        grep core:Y         temp/x2tmp/dev1p.x2sup-0-0.log && { return 1; }
        echo -n .
        sleep 2
    done
    echo "Failed to start after $max_tries tries" >&2
    return 1
}

echo "==kill previous x2sup and tcpdump"
pkill x2sup
sudo pkill tcpdump
rm -rf temp/x2tmp
rm core.*
echo "==start new x2sup "
# x2sup -initdir:temp/x2tmp/   -temp -livecheck:N -trace:'verbose:kafka2.%,timestamps'
# x2sup -initdir:temp/x2tmp/ -daemon  -temp  -livecheck:N  -trace:'verbose:kafka2.%,x2net.%,timestamps'
# x2sup -initdir:temp/x2tmp/ -daemon  -temp  -livecheck:N -proc:dev1p.x2sup-0-0 -trace:'verbose:kafka2.%, timestamps'
trace=on
# trace=off
if [ "$trace" == "on" ]; then
    echo "tracing is ON"
    x2sup -initdir:temp/x2tmp/ -daemon  -temp  -livecheck:N -proc:dev1p.x2sup-0-0 -trace:'verbose:kafka2.%,x2net.%,x2cmt.%, timestamps'
else
    echo "tracing is OFF"
    x2sup -initdir:temp/x2tmp/ -daemon  -temp   -livecheck:N   -proc:dev1p.x2sup-0-0
fi
wait_for_x2
if [ $? -ne 0 ]; then
    echo "====x2sup failed to start" >&2
    exit 1
fi
echo "==x2sup started successfully"


# mn_topic_crt.sh  
# sleep 1
# lsof -Pan -p $(pidof x2gw) -i
