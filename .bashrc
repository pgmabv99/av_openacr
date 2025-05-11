#!/bin/bash

PATH=.:$PATH:$HOME/av_openacr:$HOME/arnd/bin

# case $- in
#     *i*) ;;
#       *) return;;
# esac

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


alias acre="acr dmmeta.ns:atf_snf -ndown 99  -tree -e"
alias ci="atf_ci -cijob:% |& timestamps"
alias ci_clean="rm -rf temp/sand*"
alias ppath='echo $PATH | tr ":" "\n"'
alias gitlog='git log --oneline --graph --decorate --all --date=iso-strict'
alias gitlog1='git log --oneline --decorate --pretty=format:"%h %ad | %s%d [%an]" --date=iso-strict'
alias gitlog2='git log origin/$(git symbolic-ref --short HEAD)..HEAD --oneline --decorate --pretty=format:"%h %ad | %s%d [%an]" --date=iso-strict'

alias al='source  ~/arnd/conf/alexei/bash_profile'
gco() {
  # Check for uncommitted changes
  # if ! git diff-index --quiet HEAD --; then
  #   echo "You have uncommitted changes. Please commit or stash them before switching branches."
  #   return 1
  # fi

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

greb(){
  git add include/gen
  git add cpp/gen
  git commit --amend --no-edit
  git rebase --continue
}

x2ssh_av(){
   x2ssh clean
   x2ssh start
   sed -i 's/id_rsa/id_rsa2/g'  ~/.ssh/config.d/*

}

gbranch(){
  git for-each-ref --sort=-committerdate \
  --format="%(refname:short) - %(committerdate:short) - %(subject)" \
  refs/heads/ | \
  while read branch rest; do
    ahead=$(git rev-list --count "$branch" ^master)
    behind=$(git rev-list --count master ^"$branch")
    printf "%s %s - [ahead %d, behind %d]\n" \
      "$branch" "$rest" "$ahead" "$behind"
  done
}
