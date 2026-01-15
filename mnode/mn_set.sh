
#!/bin/bash

# type of cleint tools
# client=x2
client=ak

omplat=ak
# omplat=x2
# omplat=rp
# omplat=local


if [ "$omplat" = "ak" ]; then
  server="nj1-4.kafka-1.ext-0:1643"
elif [ "$omplat" = "x2" ]; then
  server="192.168.104.5:1558"
elif [ "$omplat" = "local" ]; then
  server=localhost:9092
else
  echo "unknown omplat:$omplat - no server assigned"
fi

# cfg=debug
cfg=release

topic=test-topic
nbatch=10
nrec=2000
echo "setup  omplat:$omplat   " 
