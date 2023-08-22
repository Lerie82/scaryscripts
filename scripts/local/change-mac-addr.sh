#!/bin/bash
# Lerie Taylor 2023
# scarylerie@gmail.com

# The first argument is the MAC address you want your device to change into
# The second argument is the device you want to change (ie; wlan0, eth0)

# If no argument are supplied then the defaults will be set, you
# can change the defaults by setting rhe variables below to whatever you want

#set the default mac
mac=0c:11:22:33:44:55 #90:61:AE:75:FB:CF

#set the default network device
dev=wlan0

if [ ! -z $1 ]
then
	mac=$1
	#echo "Please supply a MAC address. ($0 90:61:AE:75:FB:CF)"
	#exit 1
fi

if [ ! -z $2 ]
then
	dev=$2
	#echo "Please supply the device name you wish to change. ($0 90:61:AE:75:FB:CF wlan0)"
	#exit 1
fi

#put dev down
sudo ip link set dev $dev down

#change mac
sudo ip link set dev $dev address $mac

#put dev back up
sudo ip link set dev $dev up
