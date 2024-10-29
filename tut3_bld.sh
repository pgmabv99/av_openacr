#!/bin/bash
set -x
cd $HOME/openacr

echo "delete all" 
rm bin/samp_tut3
acr_ed -create -target samp_tut3 -write
acr_ed -create -ctype samp_tut3.Value -subset i32 -pooltype Tpool -write
acr_ed -create -field samp_tut3.FDb.zd_value -fstep Inline -write
echo dmmeta.fstep fstep:samp_tut3.FDb.zd_value steptype:InlineRecur | acr -merge -write
echo dmmeta.fdelay fstep:samp_tut3.FDb.zd_value delay:1.000000000 scale:N | acr -insert -write
cp conf/samp_tut3.txt cpp/samp_tut3/samp_tut3.cpp
cp ~/openacrav/driver_tut3.cpp cpp/samp_tut3/samp_tut3.cpp
ai samp_tut3 
samp_tut3