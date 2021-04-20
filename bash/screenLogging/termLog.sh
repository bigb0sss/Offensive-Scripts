#!/bin/bash
#
#
# Terminal_log Directory Check
if [ -d "/root/terminal_log" ] 
then
	echo "[+] Directory /root/terminal_log Already Exists."
else
	echo "[*] Creating /root/terminal_log Directory."
	mkdir -p /root/terminal_log
fi

# Logging Begins
todayDate=$(date)
todayFile=$(date +"%m_%d_%Y_%H_%M_%S")
filename="/root/terminal_log/termLog_$todayFile.log"

echo "[*] Terminal Logging Starts for $todayDate"
echo "[*] Log File Created: $filename"
echo "[*] You are currently in the terminal log session."
echo "    Type \"exit\" to terminate the session."
echo ""
script -q $filename

# Logging Terminated
echo "[*] Terminal Logging is ending..."
sleep 0.3
echo "[*] Log File Location: $filename"
echo ""