#!/usr/bin/env bash

#Lerie Taylor 2023
#scarylerie@gmail.com

adb_check=$(ps --no-headers -C adb)

if [ -z "$adb_check" ]
then
	echo "ADB server is not running, starting server"
	back_pid=$!
	sudo adb start-server &
	wait $back_pid
	exit 1
else
	echo "ADB server is running"
fi
