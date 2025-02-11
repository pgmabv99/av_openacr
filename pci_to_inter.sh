#!/bin/bash
echo "PCI Address      - Interface    - Driver        - MAC Address"

# Run lspci with -nn to show detailed information, then filter for ConnectX-6
lspci -nn | grep -i ConnectX-6 | while read -r line; do
    # Extract the PCI address (first field before the space) and add "0000:" prefix
    pci_address=$(echo "$line" | awk '{print "0000:" $1}')
    
    # Convert PCI address to network interface path
    interface_path="/sys/bus/pci/devices/$pci_address/net"
    
    # If the network interface folder exists, get the interface name
    if [ -d "$interface_path" ]; then
        # List the files in the 'net' directory and get the interface name
        interface=$(ls -1 "$interface_path" | head -n 1)
        
        # Get the MAC address from the interface
        mac_address=$(cat /sys/class/net/$interface/address)
        
        # Get the driver used by the interface
        driver=$(basename "$(readlink /sys/class/net/$interface/device/driver/module)")
    else
        interface="N/A"
        driver="N/A"
        mac_address="N/A"
    fi
    
    # Output the PCI address, interface, driver, and MAC address with aligned columns
    printf "%-18s - %-12s - %-14s - %-20s\n" "$pci_address" "$interface" "$driver" "$mac_address"
done
