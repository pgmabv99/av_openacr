#!/bin/bash
set -x
cd $HOME/openacr

echo "delete all" 
rm bin/samp_tut1a
acr_ed -delete -target samp_tut1a -write

acr_ed -create -target samp_tut1a -write
acr_ed -create -ctype samp_tut1a.Proj -pooltype Tpool -indexed -write
acr_ed -create -ctype samp_tut1a.Part -pooltype Tpool -indexed -write
acr_ed -create -ctype samp_tut1a.Partproj -pooltype Tpool  -write


acr_ed -create -field samp_tut1a.Partproj.p_part -arg samp_tut1a.Part -reftype Upptr -write
acr_ed -create -field samp_tut1a.Partproj.p_proj -arg samp_tut1a.Proj -reftype Upptr -write
acr_ed -create -field samp_tut1a.FDb.zd_part -write -comment "List of all parts"
acr_ed -create -field samp_tut1a.FDb.zd_proj -write -comment "List of all projects"


acr_ed -create -field samp_tut1a.Part.c_partproj -reftype Ptr -cascdel -write -comment "List of projects by part"
acr_ed -create -field samp_tut1a.Proj.zd_partproj -cascdel -write -comment "List of parts by project"
# exit 0

cat cpp/samp_tut1a/samp_tut1a.cpp  
cp ~/openacrav/samp_tut1a.cpp cpp/samp_tut1a/samp_tut1a.cpp
ai samp_tut1a 
samp_tut1a