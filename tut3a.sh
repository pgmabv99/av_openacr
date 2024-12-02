
#!/bin/bash
set -x
set -e
cd $HOME/openacr
targ="samp_tut3a"
source av_openacr/backup_tmp.sh

echo "delete all"
# exit
acr_ed -del -target $targ -write
acr_ed -create -target $targ -write
acr_ed -create -field $targ.FDb.read -arg algo_lib.FIohook -write


restore_backup_tmp

ai $targ

$targ