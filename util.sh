#!/bin/bash
# 
# Define a trap to catch any errors and display a visible error message
if [ -z "$targ" ]; then
    echo "ERROR: 'targ' variable is not set."
    exit 1
fi

trap '{ 
    echo -e "\n\033[1;31mERROR: Script exited due to an error!\033[0m"; 
    # restore the driver cpp
    echo "restore the driver cpp"
    cp  ~/openacrav/backup/$targ.cpp cpp/$targ/$targ.cpp 
}' ERR

# save the driver cpp as the genration creates a dummy  one
if [ -f cpp/$targ/$targ.cpp ] && ! grep -q "hello" cpp/$targ/$targ.cpp; then
    cp cpp/$targ/$targ.cpp ~/openacrav/backup/$targ.cpp
else
    echo "File cpp/$targ/$targ.cpp does not exist."
fi

restore_backup() {
    cp ~/openacrav/backup/$targ.cpp cpp/$targ/$targ.cpp
}
