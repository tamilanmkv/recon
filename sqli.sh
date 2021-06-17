#!/bin/bash

domain=$1
tools=~/tools

if [[ ! -d "sqli" ]] ; then
	mkdir sqlmap
fi

if [[ -f "${domain}_probed.txt" ]]; then
	#sql injection checking
	#cat gf/${domain}_sqli.txt | qsreplace FUZZ | anew -q sqlmap/.tmp_sqli.txt
	#for target in `sqlmap/.tmp_sqli.txt`;do
	#python3 $tools/sqlmap/sqlmap.py -u $target -b --batch --dbs --disable-coloring --random-agent --output-dir=sqlmap &>/dev/null
	#notify-send "sqlinjection test complete!"
	#cat gf/${domain}_sqli.txt 
	sqlmap -m gf/${domain}_sqli.txt --batch --random-agent --level 1 | tee -a sqlinjection.txt | notify 
#done

fi
#cat sqlmap/*/log | notify
