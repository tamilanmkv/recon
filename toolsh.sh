sudo apt update -y
wget https://golang.org/dl/go1.16.3.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.3.linux-amd64.tar.gz
sudo apt install golang-\* -y

echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile >> ~/.zshrc >> ~/.bashrc
echo 'export PATH=$PATH::/root/go/bin' >> ~/.profile >> ~/.zshrc >> ~/.bashrc
echo "export PATH=$PATH:`pwd`" >> ~/.profile >> ~/.zshrc >> ~/.bashrc
sudo apt install python3-pip -y
sudo apt install gospider -y
sudo apt install notify -y
sudo apt install cargo -y
sudo atp install nmap -y
#cargo install findomain
#sudo cp ~/.cargo/bin/* /usr/local/bin
go get -u github.com/KathanP19/Gxss
go get -u github.com/tomnomnom/gf
go get -u github.com/tomnomnom/httprobe
go get -u github.com/tomnomnom/anew
go get -u github.com/tomnomnom/waybackurls
GO111MODULE=on go get -v github.com/hahwul/dalfox/v2
GO111MODULE=on go get -u -v github.com/lc/gau
go get -u github.com/jaeles-project/gospider
GO111MODULE=on go get -v github.com/dwisiswant0/crlfuzz/cmd/crlfuzz
GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx
GO111MODULE=on go get -v github.com/projectdiscovery/notify/cmd/notify
go get github.com/cgboal/sonarsearch/crobat
go get -u github.com/tomnomnom/assetfinder
GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
go get github.com/hakluke/hakrawler
GO111MODULE=on go get -u -v github.com/lc/subjs
go get -u github.com/tomnomnom/qsreplace
go get -u github.com/ffuf/ffuf
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
go get -u github.com/tomnomnom/unfurl
mkdir ~/tools
cd ~/tools
https://github.com/s0md3v/XSStrike.git
pip3 install -r XSStrike/requirements.txt
git clone https://github.com/s0md3v/Corsy.git
pip3 install -r ~/tools/Corsy/requirements.txt
pip install jsbeautifier
wget https://raw.githubusercontent.com/m4ll0k/Bug-Bounty-Toolz/master/getjswords.py
git clone https://github.com/s0md3v/Arjun.git
pip install uddup
git clone https://github.com/rotemreiss/uddup.git
pip install -r ~/tools/uddup/requirements.txt
python3 ~/tools/uddup/setup.py install
python3 ~/tools/Arjun/setup.py install
git clone https://github.com/devanshbatham/ParamSpider
git clone https://github.com/six2dez/degoogle_hunter.git
git clone https://github.com/codingo/Interlace.git
pip3 install -r ~/tools/Interlace/requirements.txt
python3 ~/tools/Interlace/setup.py install
#git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
git clone https://github.com/1ndianl33t/Gf-Patterns
mv ~/tools/Gf-Patterns/*.json ~/.gf
wget https://gist.githubusercontent.com/tamilanmkv/59c1dbdfcd377b7bbe0af2afb2debfb8/raw/1dd98ce14c0446400a80e4fa70c39bb83fe29f2f/ssrf.py
wget https://gist.githubusercontent.com/tamilanmkv/9ccceb9785eca3b6ffaedf37094f6ee8/raw/8ae7eec974ecc2d8045bdbca4bc3ae77e8cbdc0c/screenshot.py
https://github.com/sqlmapproject/sqlmap.git
git clone https://github.com/Edu4rdSHL/findomain.git
cd findomain
cargo build --release
sudo cp target/release/findomain /usr/bin/

cd ~/
git clone https://github.com/projectdiscovery/nuclei-templates.git
cp -r ~/nuclei-templates/helpers ~/
git clone https://github.com/tamilanmkv/payload.git
#mkdir ~/payload
#cd ~/payload
#wget https://raw.githubusercontent.com/tamilanmkv/payloads/main/common.txt
