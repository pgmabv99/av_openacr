#!/bin/bash
set -x
set -e
cd $HOME/openacr
targ="myns"

source /home/pgmabv/openacrav/util.sh

echo "===============delete all in reverse order"
acr_ed -del -target:$targ -write
acr_ed -del -nstype:ssimdb  -target:${targ}db  -write

echo "===============create db" 
acr_ed -create -target:${targ}db  -nstype:ssimdb -write

acr_ed -create  -ssimfile:${targ}db.part -write
acr_ed -create -field ${targ}db.Part.amt -arg i32 -write -comment "amount of part"
echo "${targ}db.part part:part98 amt:980" | acr -replace -write
echo "${targ}db.part part:part99 amt:990" | acr -replace -write

# acr_ed -create  -ssimfile:${targ}db.order -write
# acr_ed -create -field ${targ}db.Order.p_part -arg ${targ}db.Part -reftype Upptr -write -comment "up pointer"
# echo "${targ}db.order order:order98_1 p_part:part98" | acr -replace -write
# echo "${targ}db.order order:order99_1 p_part:part99" | acr -replace -write
# echo "${targ}db.order order:order99_2 p_part:part99" | acr -replace -write
 
echo "==============create program and inherit from db"
acr_ed -create -target:$targ -write -comment "create program and inherit from db"

acr_ed -create -finput -target:$targ -ssimfile:${targ}db.part -write -comment "inherited from ssimfile"
acr_ed -create -field ${targ}.FDb.zd_part -write -comment "zero termindated list"
acr_ed -create -field ${targ}.FDb.ind_part -reftype:Thash -write -comment "hash/index/iterator"
acr_ed -create -field ${targ}.FPart.f_amt -arg i32 -write -comment "f_amount of part. not inherited"

# echo  "create struct Forder inherited from -ssimfile:${targ}db.order " 
# acr_ed -create -finput -target:$targ -ssimfile:${targ}db.order -write -comment "inherited from ssimfile"
# # acr_ed -create -field ${targ}.FDb.zd_order -write -comment "hash/index/iterator"

acr_ed -create -ctype $targ.Order -pooltype Tpool -indexed -write -comment "not inherited"
acr_ed -create -field $targ.Order.p_part -arg $targ.FPart -reftype Upptr -write
echo
echo " ==ctypes"
acr dmmeta.ctype:${targ}%.%
echo  " ==fields"
acr dmmeta.field:${targ}%.%

restore_backup

ai $targ

