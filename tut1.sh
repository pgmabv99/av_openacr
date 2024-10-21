#!/bin/bash
set -x
cd $HOME/openacr
rm bin/samp_tut1
acr_ed -create -target samp_tut1 -write
acr_ed -create -ctype samp_tut1.Proj -pooltype Tpool -indexed -write
acr_ed -create -ctype samp_tut1.Part -pooltype Tpool -indexed -write
acr_ed -create -ctype samp_tut1.Partproj -pooltype Tpool  -write

acr_ed -create -field samp_tut1.Partproj.p_part -arg samp_tut1.Part -reftype Upptr -write
acr_ed -create -field samp_tut1.Partproj.p_proj -arg samp_tut1.Proj -reftype Upptr -write
acr_ed -create -field samp_tut1.FDb.zd_part -write -comment "List of all parts"
acr_ed -create -field samp_tut1.FDb.zd_proj -write -comment "List of all projects"

acr_ed -create -field samp_tut1.Part.c_partproj -reftype Ptr -cascdel -write -comment "List of projects by part"
acr_ed -create -field samp_tut1.Proj.zd_partproj -cascdel -write -comment "List of parts by project"
cat cpp/samp_tut1/samp_tut1.cpp  
cp conf/samp_tut1.txt cpp/samp_tut1/samp_tut1.cpp
ai samp_tut1 
samp_tut1