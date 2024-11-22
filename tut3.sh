#!/bin/bash
set -x
set -e
targ="samp_tut3"
source av_openacr/backup_git.sh

acr_ed -create -target $targ -write
# acr_ed -create -ctype $targ.Value -subset i32 -pooltype Tpool -write
acr_ed -create -ctype $targ.Value  -pooltype   Tpool -indexed -write
acr_ed -create -field $targ.FDb.zd_value -fstep Inline -write

echo dmmeta.fstep fstep:$targ.FDb.zd_value steptype:InlineRecur | acr -merge -write
echo dmmeta.fdelay fstep:$targ.FDb.zd_value delay:1.000000000 scale:N | acr -insert -write

# acr_ed -create -field $targ.FDb.ind_value -write
# acr_ed -create -field $targ.FDb.update -arg bool -fstep InlineRecur -dflt true -write
# echo dmmeta.fdelay fstep:$targ.FDb.update delay:0.018 scale:N | acr -insert -write
 

restore_backup_git

ai $targ

$targ