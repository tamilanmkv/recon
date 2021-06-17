#!/bin/bash

domain=$1
AGENT="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0" 

if [ ! -d "nuclei" ]; then
	mkdir nuclei
fi 
if [ -f "${domain}_probed.txt" ]; then 
	cat ${domain}_probed.txt | nuclei -silent -H "${AGENT}" -t ~/nuclei-templates/takeovers/ -o nuclei/subdomain_tko.txt | notify ;
	cat ${domain}_probed.txt | nuclei -silent -H "${AGENT}" -t ~/nuclei-templates/technologies/ -o nuclei/${domain}_technologies.txt | notify;
	cat ${domain}_probed.txt | nuclei -silent -H "${AGENT}" -t ~/nuclei-templates/exposed-tokens/ -o nuclei/${domain}_tokens.txt |notify ;
	cat ${domain}_probed.txt | nuclei -silent -H "${AGENT}" -t ~/nuclei-templates/exposures/ -o nuclei/${domain}_exposures.txt | notify;
	cat ${domain}_probed.txt | nuclei -silent -H "${AGENT}" -t ~/nuclei-templates/cves/ -o nuclei/${domain}_cves.txt | notify;
	cat ${domain}_probed.txt | nuclei -silent -H "${AGENT}" -t ~/nuclei-templates/default-logins/ -o nuclei/${domain}_default_creds.txt |notify;
	cat ${domain}_probed.txt | nuclei -silent -H "${AGENT}" -t ~/nuclei-templates/dns/ -o nuclei/${domain}_dns.txt | notify;
	cat ${domain}_probed.txt | nuclei -silent -H "${AGENT}" -t ~/nuclei-templates/exposed-panels/ -o nuclei/${domain}_panels.txt | notify;
	cat ${domain}_probed.txt | nuclei -silent -H "${AGENT}" -t ~/nuclei-templates/misconfiguration/ -o nuclei/${domain}_misconfigurations.txt | notify;	
	cat ${domain}_probed.txt | nuclei -silent -H "${AGENT}" -t ~/nuclei-templates/vulnerabilities/ -o nuclei/${domain}_vulnerabilities.txt |notify;
	cat ${domain}_probed.txt | nuclei -silent -H "${AGENT}" -t ~/nuclei-templates/workflows/ -o nuclei/${domain}_workflows.txt |notify;
	notify-send "yop check out tko.txt"
	python ~/tools/subdover/subdover.py -d probed_no_http.txt -o subdomain_Takeover.txt
fi 
