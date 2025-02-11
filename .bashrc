#!/bin/bash
set -x
hostname
#lspci -nn | grep -i nvm
lspci -nn | grep -i ConnectX-6
set +x
PATH=.:$PATH:$HOME/av_openacr
alias ppath='echo $PATH | tr ":" "\n"'
alias gitlog='git log --oneline --graph --decorate --all --date=iso-strict'
alias gitlog1='git log --oneline --decorate --pretty=format:"%h %ad | %s%d [%an]" --date=iso-strict'
alias acre="acr dmmeta.ns:atf_spdk -ndown 99  -tree -e"
source    $HOME/algo/s_setup_home.sh
export EDITOR="/home/avorovich/.vscode-server/cli/servers/Stable-cd4ee3b1c348a13bafd8f9ad8060705f6d4b9cba/server/bin/remote-cli/code --wait"
