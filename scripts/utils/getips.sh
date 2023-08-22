#!/bin/bash
# Lerie Taylor 2023
# scarylerie@gmail.com

if [ $# -eq 0 ]; then
	echo "You must provide a filename. ($0 my-file.txt)"
	exit 1
fi

# 08-22-2023: updated regex
cat $1 |cut -d' ' -f2|grep -Eo '(([0-9]{1,3}\.){3}[0-9]{1,3})'|uniq
