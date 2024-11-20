#!/bin/bash
# 
# Define a trap to catch any errors and display a visible error message
# and restore the driver cpp

restore_backup_git() {
    
    # my vscode settings
    git checkout stash@{0} -- .vscode/
    # my compile options
    git checkout stash@{0} -- data/dev/tool_opt.ssim
    # my sample code  
    git checkout stash@{0} -- cpp/myns/myns.cpp
    git checkout stash@{0} -- cpp/samp_tut3/samp_tut3.cpp
    git checkout stash@{0} -- cpp/samp_tut3a/samp_tut3a.cpp
}


trap '{ 
    echo -e "\n\033[1;31mERROR: Script exited due to an error!\033[0m"; 
    # restore the driver cpp
    echo "restore the driver cpp"
    restore_backup_git
}' ERR

# save all the files
git stash -u

