#!/bin/bash
domain=$1
if [ ! -d "broken_links" ]; then
	mkdir broken_links
	mkdir broken_links/.tmp
fi
if [ -f "${domain}_probed.txt" ]; then
	interlace -tL ${domain}_probed.txt -threads 10 -c "wget --spider -r -nd -nv -H -l 1 -w 1 --no-check-certificate -U 'Mozilla' -o _output_/_cleantarget__brokenLinks.tmp _target_" -o broken_links/.tmp 
	cat broken_links/.tmp/* | grep "^http" | grep -v ':$' | anew -q broken_links/.tmp/brokenLinks_total.txt
	BROKEE=$(eval cat broken_links/.tmp/brokenLinks_total.txt | cut -d ' ' -f2 | anew -q b.tmproken_links/${domain}_brokenLinks.txt | wc -l|notify)
	if [ "BROKEE" -gt 0 ]; then
		notify-send "ho ho i found broken links check out "
	fi
else
	echo "somethings is wrong!"
fi
