#!/bin/bash

#!/bin/bash
echo "PCI Address      - Interface    - Driver        - IP Address        - MAC Address"

# Run lspci with -nn to show detailed information, then filter for ConnectX-6
lspci -nn | grep -i ConnectX-6 | while read -r line; do
    # Extract the PCI address (first field before the space) and add "0000:" prefix
    pci_address=$(echo "$line" | awk '{print "0000:" $1}')
    
    # Convert PCI address to network interface path
    interface_path="/sys/bus/pci/devices/$pci_address/net"
    
    # If the network interface folder exists, get the interface name(s)
    if [ -d "$interface_path" ]; then
        for interface in $(ls -1 "$interface_path"); do
            # Get the MAC address from the interface
            mac_address=$(cat /sys/class/net/$interface/address)
            
            # Get the driver used by the interface
            driver=$(basename "$(readlink /sys/class/net/$interface/device/driver/module)")
            
            # Get the IP address (IPv4), if assigned
            ip_address=$(ip -4 addr show "$interface" | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n 1)
            [ -z "$ip_address" ] && ip_address="No IP"
            
            # Output the PCI address, interface, driver, IP address, and MAC address with aligned columns
            printf "%-18s - %-12s - %-14s - %-16s - %-20s\n" "$pci_address" "$interface" "$driver" "$ip_address" "$mac_address"
        done
    else
        # If no interface found, output N/A
        printf "%-18s - %-12s - %-14s - %-16s - %-20s\n" "$pci_address" "N/A" "N/A" "N/A" "N/A"
    fi
done


