#!/usr/bin/env bash
#
# Version         : 1.0
# Created date    : 10/29/2020
# Last update     : 10/29/2020
# Author          : bigb0ss
# Description     : Initial Domain Controller Enumeration > Potential Target Range Generation
# Note            :

#usage() {
#	exit(0)
#}

hostnameLookup() {
	h=$(hostname)
	echo $h
}

dnsServerLookup() {
	d=$(nslookup $h | grep "Server" | cut -d ":" -f 2)
	echo $d
}

fqdn() {
	f=$(host $d | awk '{print $5}' | cut -d "." -f 2-3)
	echo $f
}

dcLookup() {
	dc=$(nslookup -type=srv _ldap._tcp.dc._msdcs.$f $d)
	echo $dc | sed 's/ /\n/g' | grep $f | grep -v msdcs | sed 's/.$//' > dc_hostname.txt &&

	while read i; do host $i; done < dc_hostname.txt >> tmp && cat tmp | cut -d " " -f 4 | sort -u > dc_ip.txt && rm tmp &&

	awk '{print $0"/24"}' dc_ip.txt > dc_ip_range.txt
}

hostnameLookup
dnsServerLookup
fqdn
dcLookup
