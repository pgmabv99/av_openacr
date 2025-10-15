#!/bin/bash
cat <<EOF > /tmp/x2port.dat
x2db.gwport  gwport:dev-x2-4.x2gw-0-0/http-0  port:1550  intf:192.168.104.5  comment:""
x2db.gwport  gwport:dev-x2-4.x2gw-0-0/https-0  port:1554  intf:192.168.104.5  comment:""
x2db.gwport  gwport:dev-x2-4.x2gw-0-0/kafka-0  port:1558  intf:192.168.104.5  comment:""
EOF

bin/acr -in:/tmp/x2port.dat % -v
