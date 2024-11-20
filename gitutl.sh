#!/bin/bash
echo "reset git to last commit and checkout my files, removing acr generated files"
set -x
cd $HOME/openacr
git stash -u
# my vscode settings
git checkout stash@{0} -- .vscode/
# my compile options
git checkout stash@{0} -- data/dev/tool_opt.ssim
# my sample code  
git checkout stash@{0} -- cpp/myns/myns.cpp
git checkout stash@{0} -- cpp/samp_tut3/samp_tut3.cpp
git checkout stash@{0} -- cpp/samp_tut3a/samp_tut3a.cpp