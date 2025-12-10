
#!/bin/bash 
source mn_set.sh
# =====================================
# clean all and start
pkill javaa || true
omcli dev.x2-4.% -dkr_clean_run -omplat:ak -ignore_omnode_use
omcli dev.x2-4.% -dkr_clean_run -omplat:x2 -ignore_omnode_use

exit 0
# cheat for brokers
find /mnt/data-*/dev.x2-4/ -type f -printf '%TY-%Tm-%Td %TH:%TM:%TS %p\n'
rm -rf /mnt/data-*/dev.x2-4/*