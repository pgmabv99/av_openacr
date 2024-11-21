#!/bin/bash
# 
# Define a trap to catch any errors and display a visible error message
# and restore the driver cpp
#!/bin/bash

# Define the stash and paths in an array
STASH_REF="stash@{0}"
FILES=(
    ".vscode/"
    "data/dev/tool_opt.ssim"
    "cpp/myns/myns.cpp"
    "cpp/samp_tut3/samp_tut3.cpp"
    "cpp/samp_tut3a/samp_tut3a.cpp"
)




restore_backup_git() {
    
    # # my vscode settings
    # git checkout stash@{0} -- .vscode/
    # # my compile options
    # git checkout stash@{0} -- data/dev/tool_opt.ssim
    # # my sample code  
    # git checkout stash@{0} -- cpp/myns/myns.cpp
    # git checkout stash@{0} -- cpp/samp_tut3/samp_tut3.cpp
    # git checkout stash@{0} -- cpp/samp_tut3a/samp_tut3a.cpp

    # Iterate over the array and execute git checkout for each path
    for file in "${FILES[@]}"; do
        git checkout $STASH_REF -- "$file"
    done

}


trap '{ 
    echo -e "\n\033[1;31mERROR: Script exited due to an error!\033[0m"; 
    # restore the driver cpp
    echo "restore the driver cpp"
    restore_backup_git
}' ERR

echo "save all the files. touch to cover case of now changes (right after commit)"
for file in "${FILES[@]}"; do
    touch "$file"
done

git stash -u

