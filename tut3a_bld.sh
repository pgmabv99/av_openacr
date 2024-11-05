#!/bin/bash
set -x
cd $HOME/openacr

rm bin/samp_tut3a
acr_ed -del -target samp_tut3a -write
acr_ed -create -target samp_tut3a -write
acr_ed -create -field samp_tut3a.FDb.read -arg algo_lib.FIohook -write
cp ~/openacrav/driver_tut3a.cpp cpp/samp_tut3a/samp_tut3a.cpp
ai samp_tut3a 
samp_tut3a