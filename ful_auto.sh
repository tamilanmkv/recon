#!/bin/bash

domain=$1
server=$2

if [[ -n "${domain}" ]]; then
	dorks.sh ${domain}
	subdomain.sh ${domain};
	echo "subdomain done"
	if [[ -f "${domain}_subdomains.txt" ]]; then
		cp ${domain}_probed.txt http_https_probed.txt		
		domain ${domain}_subdomains.txt;
		echo "live domains filtered"
	fi	
	if [[ -f "${domain}_subdomains.txt" ]]; then
		url ${domain};
		echo "url fetched"
	fi	
	if [[ -f "url_feth/${domain}_url_extract.txt" ]]; then
		gf_url ${domain};
	fi
fi

if [[ -f "${domain}_probed.txt" ]]; then
	crlf.sh ${domain};
	subtakeover.sh ${domain};
	cors.sh ${domain};
	fuzzy.sh ${domain};
#	broken_link_hijack.sh ${domain};
fi
sqli.sh ${domain};
#ssti.sh ${domain};
#lfi.sh ${domain};
if [[ -n "${server}" ]]; then
	xss.sh ${domain} ${server}
	ssrf.sh ${domain} ${server}
else
	xss.sh $[domain}
fi
