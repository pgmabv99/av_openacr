#!/bin/bash

PATH=.:$PATH:$HOME/av_openacr:$HOME/arnd/bin

case $- in
    *i*) ;;
      *) return;;
esac

# the rest for interactive shell only
set -x
hostname
#lspci -nn | grep -i nvm
tmp_code=$(find /home/avorovich/.vscode-server/cli/servers/ -type d -name "Stable*" | sort | tail -n 1)
# echo "tmp_code=$tmp_code"
export EDITOR="$tmp_code/server/bin/remote-cli/code --wait"
# this does not work
# git config --global core.editor "$tmp_code/server/bin/remote-cli/code"

lspci -nn | grep -i ConnectX-6
set +x


# source    $HOME/algo/s_setup_home.sh
if [ -f /usr/share/bash-completion/completions/git ]; then
    . /usr/share/bash-completion/completions/git
fi


alias acre="acr dmmeta.ns:x2bm_pcap -ndown 99  -tree -e"
alias ppath='echo $PATH | tr ":" "\n"'
alias gitlog='git log --oneline --graph --decorate --all --date=iso-strict'
alias gitlog1='git log --oneline --decorate --pretty=format:"%h %ad | %s%d [%an]" --date=iso-strict'
alias gbranch='git for-each-ref --format="%(refname:short) %(contents:subject) %(authorname)" refs/heads/'
alias al='source  ~/arnd/conf/alexei/bash_profile'
gco() {
  # Check for uncommitted changes
  if ! git diff-index --quiet HEAD --; then
    echo "You have uncommitted changes. Please commit or stash them before switching branches."
    return 1
  fi

  # Check if a branch name is passed as an argument or prompt the user
  if [ -z "$1" ]; then
    read -p "Enter branch name: " branch
  else
    branch=$1
  fi

  # Checkout the branch
  git checkout algornd/arnd.$branch
  
  # Display the last two commits
  echo "Last 2 commits on branch algornd/arnd.$branch:"
  git log -n 3 --oneline --date=local
}



