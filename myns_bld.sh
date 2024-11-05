#!/bin/bash
set -x
cd $HOME/openacr

rm bin/myns
acr_ed -del -nstype:ssimdb  -target:mynsdb  -write
acr_ed -del -target:myns -write

echo "create db" 
acr_ed -create -target:mynsdb  -nstype:ssimdb -write
acr_ed -create  -ssimfile:mynsdb.orders -write
acr_ed -create -field mynsdb.Orders.amt -arg i32 -write -comment "amount of order"
echo "mynsdb.orders orders:order1 amt:10" | acr -replace -write
echo "mynsdb.orders orders:order2 amt:20" | acr -replace -write

echo "create program"
acr_ed -create -target:myns -write
acr_ed -create -ctype myns.Orders -pooltype Tpool -indexed -write
acr_ed -create -field myns.Orders.amt -arg i32 -write -comment "amount of order"

acr_ed -create -field myns.FDb.zd_orders -write -comment "List of all orders"
acr_ed -create -finput -target:myns -ssimfile:mynsdb.orders -write
acr_ed -create -foutput -target:myns -ssimfile:mynsdb.orders -write

acr dmmeta.ctype:myns%.%
acr dmmeta.field:myns%.%  
