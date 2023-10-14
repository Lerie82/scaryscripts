#!/usr/bin/env bash
#Lerie Taylor 2023
#scarylerie@gmail.com
#execute shell commands

if [ -z "$1" ]
then
	echo "supply a command (ie; $0 \"uname -a\")"
	exit 1
fi

cmd=$(adb shell $1)
echo "$cmd"
