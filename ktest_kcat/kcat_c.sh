#!/bin/bash
set -x
source ~/av_openacr/ktest_kcat/hosts.sh

# echo "from beginning "
# kcat -b $host:$port -C -t $topic -o beginning -e
# echo "from number "
# kcat -b $host:$port -C -t $topic -p 0 -o 4  -e
echo "consumer groups . "
kcat -b $host:$port  -G my-group  $topic   -X auto.commit.interval.ms=100 -f 'Value: %s\n'