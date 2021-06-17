#!/bin/bash

domain=$1 
if [[ ! -d "crlf" ]]; then
	mkdir crlf
fi
	if [[ -f "${domain}_probed.txt" ]]; then
		eval crlfuzz -l ${domain}_probed.txt -o crlf/${domain}_crlf.txt &>/dev/null | notify
	fi
