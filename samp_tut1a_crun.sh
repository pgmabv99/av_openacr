#!/bin/bash
set -x
cd $HOME/openacr
cp conf/samp_tut1a_driver.cpp cpp/samp_tut1a/samp_tut1a.cpp
# backup  driver cpp
cp cpp/samp_tut1a/samp_tut1a.cpp /home/pgmabv/openacrav/samp_tut1a_driver.cpp
ai samp_tut1a 
samp_tut1a