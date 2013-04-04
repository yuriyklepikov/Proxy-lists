#!/bin/bash
# Extract proxies from samair.ru


echo "[+] Samair Proxy Leecher V 0.00000000001"
echo "[-] Downloads a list of proxies and stores them in proxys.conf ip:port"
sleep 2

if [ -f proxys.conf ]; then
echo "[+] Previous proxys.conf detected....deleting"
rm proxys.conf
fi

if [ -f proxys*.tm ]; then
echo "[+] Previous proxys.tm detected....deleting"
rm proxys.tm
fi

for i in `seq -w 01 10` ; do 
echo "[+] Parsing : *samair.ru* : Proxy page : ${i} done"
wget -t 3 -T15 -w3 http://samair.ru/proxy/proxy-${i}.htm -O proxys${i}.tm - -q ; done

echo "[+] Extracting IP'S and PORTS"
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]{1,4}' *.tm | sort -u >> proxys.conf

proxies=`wc -l proxys.conf | cut -d " " -f 1`

echo "[+] Done, We've $proxies proxies"

