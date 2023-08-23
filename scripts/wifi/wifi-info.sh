#!/bin/bash
# Lerie Taylor 2023
# scarylerie@gmail.com

#configure
#my_iface=wlan0
#ap_bssid=02:fe:5d:b0:81:3e
#ap_essid='Pvt.WiFiRanger_Sky4LTE.5206'
#ap_chan=6

if [ $# -ne 4 ]; then
	echo "$0 [wlan iface] [ap bssid] [ap essid] [ap channel]"
	exit 1
fi

my_iface=$1
ap_bssid=$2
ap_essid=$3
ap_chan=$4

#check for and kill things that might interfere
sudo airmon-ng check kill

#set the MAC from our interface
my_mac=$(ifconfig $my_iface |grep -Eo '([0-9a-f]{2}\:){5}[0-9a-f]{2}')

#stop the interface
sudo airmon-ng stop mon0
sudo airmon-ng stop $my_iface

#start the interface in monitor mode
sudo airmon-ng start $my_iface

#start capturing packets
sudo airodump-ng -c $ap_chan --bssid $ap_bssid -w psk $my_iface
