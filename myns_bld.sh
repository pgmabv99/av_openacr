#!/bin/bash
set -x
cd $HOME/openacr

# save the driver cpp as the genration creates a new one
cp  cpp/myns/myns.cpp ~/openacrav/backup/myns_driver.cpp
acr_ed -del -nstype:ssimdb  -target:mynsdb  -write
acr_ed -del -target:myns -write

echo "create db" 
acr_ed -create -target:mynsdb  -nstype:ssimdb -write
acr_ed -create  -ssimfile:mynsdb.orders -write
acr_ed -create -field mynsdb.Orders.amt -arg i32 -write -comment "amount of order"
echo "mynsdb.orders orders:order98 amt:980" | acr -replace -write
echo "mynsdb.orders orders:order99 amt:990" | acr -replace -write

echo "create program"
acr_ed -create -target:myns -write
acr_ed -create -ctype myns.Orders -pooltype Tpool -indexed -write
acr_ed -create -field myns.Orders.amt -arg i32 -write -comment "amount of order"

acr_ed -create -field myns.FDb.zd_orders -write -comment "List of all orders"
acr_ed -create -finput -target:myns -ssimfile:mynsdb.orders -write
# acr_ed -create -foutput -target:myns -ssimfile:mynsdb.orders -write

acr dmmeta.ctype:myns%.%
acr dmmeta.field:myns%.% 

cat cpp/myns/myns.cpp

# restore the driver cpp
cp  ~/openacrav/backup/myns_driver.cpp cpp/myns/myns.cpp 
