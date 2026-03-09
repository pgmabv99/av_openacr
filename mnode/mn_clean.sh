
#!/bin/bash 
echo "=====================dkr-destroy - clean all nodes=============================="
pkill java || true
omcli nj1-4 -dkr_destroy -force -ignore_omplat   -ignore_node_passive

exit 0
# cheat for brokers
dkr -k8cmd:"kubectl get pods -n nj1-4 "
find /mnt/data-*/nj1-4/ -type f -printf '%TY-%Tm-%Td %TH:%TM:%TS %p\n'
rm -rf /mnt/data-*/nj1-4/*