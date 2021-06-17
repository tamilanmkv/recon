#!/bin/bash

domain=$1
if [ -f "${domain}_subdomains.txt" ]; then
	mkdir portscan
	for sub in $(cat ${domain}_subdomains.txt); do
		dig +short a $sub | tail -n1 | anew -q portscan/${domain}_subdomains_ips.txt
	done
	eval nmap --top-ports 1000 -sV -n --max-retries 2 -iL portscan/${domain}_subdomains_ips.txt -oN portscan/${domain}_portscan_active.txt
else
	echo "[x] somthing is wrong"
fi
