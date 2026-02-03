
#!/bin/bash

# type of cleint tools
# client=x2
# client=rdk
client=ak

omplat=ak
# omplat=x2
# omplat=x2/ak
# omplat=rp
# omplat=local


if [ "$omplat" = "ak" ]; then
  server="nj1-4.kafka-1.ext-0:1643"
elif [ "$omplat" = "x2" ]; then
  # server="192.168.104.5:1558"
  server="192.168.104.2:1519"
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
nbatch=10
nrec=2000
echo "setup  omplat:$omplat   " 
