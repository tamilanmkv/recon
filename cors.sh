#!/bin/bash

tools=~/tools
domain=$1
if [[ ! -d "cors" ]]; then
	mkdir cors	
fi
if [[ -f "${domain}_probed.txt" ]]; then
	eval python3 $tools/Corsy/corsy.py -i ${domain}_probed.txt | anew -q  cors/${domain}_cors.txt
	notify-send "Cors misconfiguration done!"
else
	echo "somethins is wrong"
fi

