#!/bin/bash
set -x
set -e
# Define a trap to catch any errors and display a visible error message
trap '{ 
    echo -e "\n\033[1;31mERROR: Script exited due to an error!\033[0m"; 
    # restore the driver cpp
    echo "restore the driver cpp"
    cp  ~/openacrav/backup/myns_driver.cpp cpp/myns/myns.cpp 
}' ERR

cd $HOME/openacr

# save the driver cpp as the genration creates a dummy  one
cp  cpp/myns/myns.cpp ~/openacrav/backup/myns_driver.cpp

echo "===============delete all"
acr_ed -del -nstype:ssimdb  -target:mynsdb  -write
acr_ed -del -target:myns -write

echo "===============create db" 
acr_ed -create -target:mynsdb  -nstype:ssimdb -write
acr_ed -create  -ssimfile:mynsdb.orders -write
acr_ed -create -field mynsdb.Orders.amt -arg i32 -write -comment "amount of order"
echo "mynsdb.orders orders:order98 amt:980" | acr -replace -write
echo "mynsdb.orders orders:order99 amt:990" | acr -replace -write
 
echo "==============create program and inherit from db"
acr_ed -create -target:myns -write
junk
echo  "create struct Forder inherited from -ssimfile:mynsdb.orders " 
acr_ed -create -finput -target:myns -ssimfile:mynsdb.orders -write

echo "create iterator for Forder"
acr_ed -create -field myns.FDb.zd_orders -write -comment "List of all orders"

acr dmmeta.ctype:myns%.%
acr dmmeta.field:myns%.% 

# cat cpp/myns/myns.cpp

# restore the driver cpp
cp  ~/openacrav/backup/myns_driver.cpp cpp/myns/myns.cpp 
