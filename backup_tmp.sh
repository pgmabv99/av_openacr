#!/bin/bash
#
# Define a trap to catch any errors and display a visible error message
# and restore the driver cpp
#!/bin/bash


restore_backup_tmp() {
    cp /tmp/$targ.cpp cpp/$targ/$targ.cpp
}

trap '{
    echo -e "\n\033[1;31mERROR: Script exited due to an error!\033[0m";
    # restore the driver cpp
    echo "restore the driver cpp"
    restore_backup_tmp
}' ERR

echo "save all the $targ.cpp. "
cp  cpp/$targ/$targ.cpp /tmp/$targ.cpp
