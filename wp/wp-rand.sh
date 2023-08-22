#!/bin/bash
#Lerie Taylor
#2023

## TODO #################
# [] Remove hardcoded directory value for getips.sh
## TODO #################

# This script will attempt to locate the wp-json rpc file using nmap and curl.

#colors
RED="\e[31m"
STRIKE="\e[9m"
BLACK="\e[30m"
GOLD="\e[33m"
GREEN="\e[32m"
BGBLK="\e[40m" #backgrounds
BGRED="\e[41m"
BGGREEN="\e[42m"
NOC="\e[0m" #reset

#check for scan argument
if [ -z $1 ]
then
	NUMHOSTS=50
else
	NUMHOSTS=$1
fi

echo -e "\e${BGRED}Number of hosts to scan: ${NUMHOSTS}\e${NOC}"
echo -e "\e${GREEN}Scanning\e${NOC}.."
sudo nmap -p80,443 -iR $NUMHOSTS -T4 --open -oG scanresult 2>&1>/dev/null

echo -e "\e${GREEN}Gathering IP's..\e${NOC}"
/home/sun/Downloads/sunj/scripts/utils/getips.sh scanresult|sed -E 's/([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})/http:\/\/\1\/wp-json/g' >hosts

while IFS= read -r url; do
	echo -en "\e${BGGREEN}\e${BLACK}Checking:\e${NOC} $url\t\t"
	#curl -s -I $url |head -n1
	check=$(curl -sL --insecure -I $url|head -n1)
	echo -e "\e${GOLD} $check"
done < hosts

#echo "Done."
