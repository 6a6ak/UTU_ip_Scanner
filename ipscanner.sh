#!/bin/bash

# Set the IP range to scan
IP_RANGE="192.168.1.*"

# Run the nmap scan and store the output in a variable
SCAN_OUTPUT=$(sudo nmap -sP $IP_RANGE)

# Print the active IP addresses
echo "Active IP addresses on the network:"
echo "$SCAN_OUTPUT" | grep "Nmap scan report" | cut -d' ' -f5
