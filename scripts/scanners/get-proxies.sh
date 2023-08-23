#!/bin/bash
# Lerie Taylor 2023
# scarylerie@gmail.com

#free proxy sites that show ips and ports
sites=(
	https://proxyscrape.com/free-proxy-list
	https://free-proxy-list.net/
)

# geonode returns json
echo "Gathering proxies from geonode"
lynx -dump 'https://proxylist.geonode.com/api/proxy-list?limit=500&page=1&sort_by=lastChecked&sort_type=desc'>geonode.json
cat geonode.json | jq -cr '.data[] | .ip,.port' |paste - - |sed -rn 's/\s/:/p' >plist

#advanced.name proxies and port numbers are base64 encoded
echo "Gathering proxies from advanced.name"
curl -s "https://advanced.name/freeproxy" >freeproxy
cat freeproxy|grep -Po "data-ip=.([a-zA-Z0-9=]+)"|cut -d'"' -f2 >ips
cat freeproxy|grep -Po "data-port=.([a-zA-Z0-9=]+)"|cut -d'"' -f2 >ports
paste -d ":" ips ports >ipports

echo "Decoding advanced.name proxies"
while read -r line;
do
	decoded_ip=$(echo $line |cut -d":" -f1|base64 -d)
	decoded_port=$(echo $line |cut -d":" -f2|base64 -d)
	echo "$decoded_ip:$decoded_port" >>plist
done <ipports

# loop through the free proxy sites
for proxy_site in ${!sites[@]}; do
	site=${sites[proxy_site]}
	echo "Gathering proxies from $site"
	lynx -dump ${sites[proxy_site]} >src
	cat src |grep -Eo '(([0-9]{1,3}\.){3}[0-9]\S*[0-9]{1,5})' >>plist
done

pcount=$(wc -l plist)
filen=$(date '+%m%d%y-%H%M')
mv plist $SCARYDIR/proxies/$filen

echo "Cleaning up.."
rm geonode.json \
	src ips ports \
	ipports freeproxy \
	ipports2

echo "$pcount Proxies found and archived"
