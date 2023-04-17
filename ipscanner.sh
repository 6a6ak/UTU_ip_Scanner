#!/bin/bash

# Check if nmap is installed
if ! command -v nmap &> /dev/null; then
    echo "nmap is not installed. Installing nmap..."
    sudo apt update && sudo apt install -y nmap
fi

# Get the IP address range from the user
read -p "Enter the IP address range (e.g., 192.168.0.0/24): " ip_range

# Scan the local network for online devices
echo "Scanning the local network for online devices..."

# Store the results in an array
mapfile -t results < <(nmap -sn $ip_range | grep "Nmap scan report for")

# Print the online IPs in a nicer format
echo "Online devices:"
for result in "${results[@]}"; do
    ip=$(echo $result | awk '{print $NF}')
    echo "- $ip"
done
