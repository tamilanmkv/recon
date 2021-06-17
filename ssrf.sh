domain=$1
#SERVER=$2
#tools=~/tools
#HEADER="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0"
if [ ! -d "ssrf" ]; then
	mkdir ssrf
fi
#if [ -n "$SERVER" ]; then
	#cat gf/${domain}_ssrf.txt | qsreplace FUZZ | anew -q .tmp/tmp_ssrf.txt
	#echo $SERVER_FIX=$(echo SERVER | sed -r "s/https?:\/\///") | anew -q .tmp/ssrf_server.txt
	#for url in $(cat ssrf/.tmp/tmp_ssrf.txt); do
	#	ffuf -v -H "${HEADER}" -w .tmp/ssrf_server.txt -u $url &>/dev/null | grep "URL" | sed 's/| URL | //' | anew -q ssrf/${domain}_ssrf.txt
	#done
if [ $1 != 0 ]; then	
	/usr/bin/python3 ~/tools/ssrf.py `pwd`/gf/${domain}_ssrf.txt $2 | anew -q ssrf/${domain}_ssrf.txt
else
	echo 'noo';
#fi
fi
