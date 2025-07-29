#!/bin/bash
set -x
set -e

# one time only !!!!!!!!!!!!!!!!!!
# acr_ed -create -srcfile cpp/x2gw/x2flt_brg.cpp -write -comment "x2flt exit bridge "


acr_ed -del  -ctype x2gw.X2flt    -write || true


#-------------main CB
acr_ed -create -ctype x2gw.X2flt                              -write -comment "x2flt CB"
acr_ed -create -field x2gw.X2flt.count                      -arg u64                -write -comment "test count"

# include into _db
acr_ed -del    -field x2gw.FDb.x2flt                        -write
acr_ed -create -field x2gw.FDb.x2flt                          -arg x2gw.X2flt        -write -comment ""


# ai

echo "done!!!!!!!!!!!!"
