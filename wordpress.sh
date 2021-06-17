AGENT="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0" 
file=$2
if [ ! -d "wordpress" ]; then
	mkdir wordpress
fi
if [ -f "${file}" ];then 
	sed -i -e 's/$/FUZZ' ${file};
	for url in ${file}; do
		ffuf -mc all -fc 404 -ac -sf -s -H "${AGENT}" -w $fuzz_wordlist -maxtime 900 -u $sub/FUZZ -o fuzzy/${sub_out}.tmp &>/dev/null

	done
fi
for i in `cat nuclei/${1}_technologies.txt | grep "wordpress" | awk '{ print $4 }' |sed -r "s/https?:\/\///"`; do
#	nam=echo $i | "
	wpscan --ignore-main-redirect --url "https://$i" --random-user-agent -e vp --api-token  kSNfisWMawyVlBIPF7tDd2qmEzXafRMQrvfBQcOlS6Q -o wordpress/${i}_scan.txt
	if [[ $? == 0 ]]; then
		continue
	fi
done

