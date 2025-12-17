
#!/bin/bash 
source mn_set.sh
# =====================================
# clean all and start
pkill javaa || true
# omcli nj1-4.% -dkr_clean_run -omplat:ak -ignore_omnode_use
# omcli nj1-4.% -dkr_clean_run -omplat:x2 -ignore_omnode_use
omcli nj1-4 -dkr_destroy -force -ignore_omplat -ignore_omnode_use

exit 0
# cheat for brokers
find /mnt/data-*/nj1-4/ -type f -printf '%TY-%Tm-%Td %TH:%TM:%TS %p\n'
rm -rf /mnt/data-*/nj1-4/*