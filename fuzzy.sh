#!/bin/bash

domain=$1
fuzz_wordlist=~/payload/common.txt
AGENT="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0" 

if [ ! -d "fuzzy" ]; then
	mkdir fuzzy
fi
if [ -f "${domain}_probed.txt" ]; then
	
	for sub in `cat ${domain}_probed.txt`; do
		sub_out=$(echo $sub | sed -e 's|^[^/]*//||' -e 's|/.*$||')
		ffuf -mc all -fc 404 -ac -sf -s -H "${AGENT}" -w ${fuzz_wordlist} -maxtime 900 -u $sub/FUZZ -o fuzzy/${sub_out}.tmp &>/dev/null
		eval cat fuzzy/${sub_out}.tmp | jq '[.results[]|{status: .status, length: .length, url: .url}]' | grep -oP "status\":\s(\d{3})|length\":\s(\d{1,7})|url\":\s\"(http[s]?:\/\/.*?)\"" | paste -d' ' - - - | awk '{print $2" "$4" "$6}' | sed 's/\"//g' | anew -q fuzzy/${sub_out}.txt
		sleep 60;	
	#`eval rm fuzzy/${sub_out}.tmp 
	done
fi
