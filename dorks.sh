#!/bin/bash

domain=$1
tools=~/tools
if [[ -n "${domain}" ]]; then
	$tools/degoogle_hunter/degoogle_hunter.sh $domain | tee ${domain}_dorks.txt
	sed -r -i "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" ${domain}_dorks.txt
fi
