#!/bin/bash
# Lerie Taylor 2023
# scarylerie@gmail.com
# retrieve information about a pornhub video URL

if [ -z $1 ]
then
	echo "Please supply a PH URL (ie; $0 https://www.pornhub.com/view_video.php?viewkey=64eea7c904e51"
	exit 1
fi

# get the url (of a video) from the user
# ie; https://www.pornhub.com/view_video.php?viewkey=64eea7c904e51

# download to file
#curl -sL -o videoinfo $1

# parse video info
title=$(cat videoinfo |grep -Eo '<title>(.+)<\/title>'|cut -d'>' -f2|cut -d'<' -f1)
tags=$(cat videoinfo |grep -Po "\/video\/search\?search\=\w+\">(\w+)<\/a>"|cut -d'>' -f2|cut -d'<' -f1|tr '\n' ','|sed 's/.$//')
cats=$(cat videoinfo |grep -Po "\'Category\'\)\;\">(\w+)<\/a>"|cut -d'>' -f2|cut -d'<' -f1|tr '\n' ','|sed 's/.$//')
thumb=$(cat videoinfo |grep -Po '(https\:\/\/\w+\.phncdn\.com\/videos\/\d+\/\d+\/\d+\/original\/.+$)'|cut -d'"' -f1|head -n1)
links=$(cat keys |sed -e 's/^/https\:\/\/www.pornhub.com\/view_video.php\?/'|uniq -u)

echo "title: $title"
echo "tags: $tags"
echo "cats: $cats"
echo "thumb: $thumb"
echo "links: $links"
