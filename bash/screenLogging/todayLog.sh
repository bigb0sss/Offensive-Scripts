#!/bin/bash
#
#
today=$(date)
host=$(hostname)
ip=$(ifconfig)

# Display
echo ""
echo "[*] Terminal Log Begins..."
echo "--------------------------------------------------------------------------"
echo "Date: $today                     Host:$host"
echo ""
echo "IP:"
echo "$ip"
echo "--------------------------------------------------------------------------"
echo ""