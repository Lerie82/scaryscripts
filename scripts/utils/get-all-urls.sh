#!/bin/bash

if [ -z ${@#} ]
then
	echo "You must supply a domain name (ie; $0 scarylerie.com)"
	exit 1
fi

url=$1
lynx -dump -listonly -nonumbers -hiddenlinks=merge $url
