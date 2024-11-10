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

acr_ed -create -field myns.FDb.ind_orders -reftype:Thash -write -comment "index of orders"

# dmmeta.field  field:myns.FDb.ind_orders  arg:myns.FOrders reftype:Thash  dflt:""  comment:""
#   dmmeta.thash  field:myns.FDb.ind_orders  hashfld:mynsdb.Orders.orders  unique:Y  comment:""
#   dmmeta.xref  field:myns.FDb.ind_orders  inscond:true  via:""


# dmmeta.field  field:x2node.FDb.ind_envnode  arg:x2node.FEnvnode  reftype:Thash  dflt:""  comment:""
#   dmmeta.thash  field:x2node.FDb.ind_envnode  hashfld:x2rdb.Envnode.envnode  unique:Y  comment:""
#   dmmeta.xref  field:x2node.FDb.ind_envnode  inscond:true  via:""

echo " ==ctypes"
acr dmmeta.ctype:myns%.%
echo " ==fields"
acr dmmeta.field:myns%.% 


# restore the driver cpp
cp  ~/openacrav/backup/myns_driver.cpp cpp/myns/myns.cpp 
