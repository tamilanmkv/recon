#!/bin/bash
if [ ! -d ".tmp" ];then 
    mkdir .tmp 
   # if [ ! -d "${domain}"];then 
        #mkdir ${domain}
        #fi
fi

AGENT="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0" #user agent 
domain=$1 #domain name 

    
tools=~/tools #common tools path 
DEBUG_ERROR="2&>/dev/null"
DEBUG_STD="&>/dev/null" # for net output 

if [ -n "${domain}" ];then
    eval subfinder -all -d $domain -all -o .tmp/subfinder.txt $DEBUG_STD
	eval assetfinder --subs-only $domain $DEBUG_ERROR | anew -q .tmp/assetfinder.txt
	#eval amass enum -passive -d $domain -config $AMASS_CONFIG -o .tmp/amass.txt $DEBUG_STD
	eval findomain --quiet -t $domain -u .tmp/findomain.txt $DEBUG_STD
	eval crobat -s $domain $DEBUG_ERROR | anew -q .tmp/crobat.txt
    eval cat .tmp/subfinder.txt .tmp/assetfinder.txt .tmp/findomain.txt .tmp/crobat.txt | anew -q ${domain}_subdomains.txt
    notify-send "Subdomain scan done!"
    rm -r .tmp
        else
            echo "[x] something is wrong check out input"
fi
if [ -f "${domain}_subdomains.txt" ];then 
    echo "[x] httpx probe start";
    cat ${domain}_subdomains.txt | httpx -follow-host-redirects -H "${AGENT}" -status-code -timeout 15 -silent -no-color | cut -d ' ' -f1 | grep ".$domain$" | anew -q ${domain}_probed.txt
    notify-send "httpx probe end next subtakeover checking now "
        else
            echo "something is wrong "
            
fi
<<<<<<< HEAD

cp ${domain}_probed.txt http_https_probed.txt
=======
cp ${domain}_subdomains.txt http_https_probed.txt
>>>>>>> 7d6c476de8028d1dacd8c9a109244ba4d122b33d
