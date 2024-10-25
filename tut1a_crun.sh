#!/bin/bash
set -x
cd $HOME/openacr

cp /home/pgmabv/openacrav/driver_tut1a.cpp cpp/samp_tut1a/samp_tut1a.cpp
rm bin/samp_tut1a
ai samp_tut1a 
samp_tut1a