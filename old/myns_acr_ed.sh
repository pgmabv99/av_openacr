#!/bin/bash
set -x
set -e

targ="myns"


# backup  the current driver code
source av_openacr/backup_tmp.sh

echo "===============create db"
acr_ed -del -target:${targ}     -write
acr_ed -del -target:${targ}db    -write

acr_ed -create -target:${targ}db  -nstype:ssimdb -write

acr_ed -create  -ssimfile:${targ}db.part -write
acr_ed -create -field ${targ}db.Part.amt -arg i32 -write -comment "amount of part"
echo "${targ}db.part part:part98 amt:10" | acr -replace -write
echo "${targ}db.part part:part99 amt:10" | acr -replace -write

# acr_ed -create  -ssimfile:${targ}db.order -write
# acr_ed -create -field ${targ}db.Order.p_part -arg ${targ}db.Part -reftype Upptr -write -comment "up pointer"
# echo "${targ}db.order order:order98_1 p_part:part98" | acr -replace -write
# echo "${targ}db.order order:order99_1 p_part:part99" | acr -replace -write
# echo "${targ}db.order order:order99_2 p_part:part99" | acr -replace -write

echo "==============create program and inherit from db"
acr_ed -create -target:$targ -write -comment "create program and inherit from db"
#
acr_ed -create -srcfile cpp/myns/util.cpp -target myns -write
acr_ed -create -srcfile cpp/myns/util.h -target myns -write

acr_ed -create -finput -target:$targ -ssimfile:${targ}db.part -write -comment "inherited from ssimfile"
acr_ed -create -field ${targ}.FDb.zd_part -write -comment "zero terminated list"
acr_ed -create -field ${targ}.FDb.ind_part -reftype:Thash -write -comment "hash/index/iterator"
acr_ed -create -field ${targ}.FPart.f_amt -arg i32 -write -comment "f_amount of part. not inherited"

# steps anchored in FDb
acr_ed -create -field $targ.FDb.sched1 -arg bool -fstep InlineRecur -dflt true -write
echo dmmeta.fdelay fstep:$targ.FDb.sched1 delay:5 scale:N | acr -insert -write

# this fails
# acr_ed -create -field ${targ}.FDb.zd_part -write -fstep Inline -comment "zero terminated list"

# wip: attempt to add zd on ctype inherited from ssimfile
# echo  "create struct Forder inherited from -ssimfile:${targ}db.order "
# acr_ed -create -finput -target:$targ -ssimfile:${targ}db.order -write -comment "inherited from ssimfile"

acr_ed -create -ctype $targ.Order -pooltype Tpool -indexed -write -comment "not inherited"
acr_ed -create -field $targ.Order.p_part -arg $targ.FPart -reftype Upptr -write
acr_ed -create -field $targ.Order.quantity -arg i32  -write
acr_ed -create -field $targ.Order.filled -arg bool  -write -comment "filled or not"

# 2 lists to the same ctype
acr_ed -create -field $targ.FDb.zd_order -cascdel -write -fstep InlineRecur -comment "List _db->order with fstep"
echo dmmeta.fdelay fstep:$targ.FDb.zd_order delay:5 scale:Y | acr -insert -write

acr_ed -create -field $targ.FPart.zd_partorder -arg $targ.Order -via $targ.Order.p_part -cascdel -write -comment "List part->order"


echo "server listening hook/ fd"
acr_ed -create -field $targ.FDb.listen -arg algo_lib.FIohook -write
echo "client connection hook/ socket"
acr_ed -create -ctype $targ.Client -pooltype Tpool -indexed -write  -comment "client hook/socket"
acr_ed -create -field $targ.Client.read -arg algo_lib.FIohook -write
acr_ed -create -field $targ.Client.lastbuff -arg algo.Smallstr50 -write

echo "terminal  hook/ fd"
acr_ed -create -field $targ.FDb.terminal -arg algo_lib.FIohook -write

echo
echo " ==ctypes"
acr dmmeta.ctype:${targ}%.%
echo  " ==fields"
acr dmmeta.field:${targ}%.%
echo  " ==fdelay"
acr dmmeta.fdelay:${targ}%.%

restore_backup_tmp

# ai $targ
