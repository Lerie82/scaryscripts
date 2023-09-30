#!/usr/bin/env bash
#Lerie Taylor
#2023

this_dir=$(pwd)
ss_dir="$this_dir/shots"

if [ ! -d "$ss_dir" ]
then
	mkdir $ss_dir
fi

#get the image count
img_count=$(ls shots/|wc -l)

#screenshot to Download folder
adb shell "screencap -p /sdcard/Download/screenshot-$img_count.png"

#pull screenshot
adb pull /sdcard/Download/screenshot-$img_count.png $ss_dir
