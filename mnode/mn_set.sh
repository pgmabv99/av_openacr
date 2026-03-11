
#!/bin/bash

# type of client tools
# client=x2
# client=rdk
client=ak

# 
omplat=ak
# omplat=x2
# omplat=x2/akmn
# omplat=rp
omplat=local


if [ "$omplat" = "ak" ]; then
  server="nj1-4.kafka-1.ext-0:1643"
elif [ "$omplat" = "x2" ]; then
  # server="192.168.104.2:1519"
  server="nj1-4.x2-3.ext-0:1519"
elif [ "$omplat" = "local" ]; then
  server=localhost:54005 
elif [ "$omplat" = "x2/ak" ]; then
   echo "double omplat$omplat - no server assigned"
else
  echo "unknown omplat:$omplat - no server assigned"
fi

broker=$server

# cfg=debug
cfg=release

topic=test-topic0
nbatch=1
nrec=100
echo "setup  omplat:$omplat   " 

