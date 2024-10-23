#!/bin/bash
set -x
cd $HOME/openacr
git checkout stash@{0} -- .vscode/
git checkout stash@{0} -- data/dev/tool_opt.ssim