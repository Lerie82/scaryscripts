#!/bin/bash
# Lerie Taylor 2023
# scarylerie@gmail.com

#show a list of nearby wireless access points
#sudo iw wlan0 scan |grep -oE 'SSID: (.+?)'|cut -d':' -f2

#
#get list of ap's (file: aps)
echo "Gathering access points.."
sudo iwlist wlan0 scan >tmp/aps

#get the access point names
cat tmp/aps |grep -i ssid >tmp/apnames

#get the ap security method (files: aps2)
#echo "Parsing security methods.."
cat tmp/aps|grep -iE 'wep|wpa' >tmp/aps2

#merge the two aps files
#echo -e "Working.."
paste -d "\n" tmp/apnames tmp/aps2 >tmp/file

#show the network and security method
awk '{$1=$1;print}' tmp/file
