#!/bin/bash
# Lerie Taylor 2023
# scarylerie@gmail.com
# download the main category list for pornhub

#download the categories page
echo "Downloading categories"
curl -sL -o categories https://www.pornhub.com/categories

echo "Parsing categories"
#return the categories
cat categories |sed -rn 's/<strong>(.+)<\/strong>/\1/p' |sed 's/^[ \t]*//' >cats

echo "Cleaning up"
mv cats categories
