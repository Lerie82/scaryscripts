#!/bin/bash
# Lerie Taylor 2023
# scarylerie@gmail.com
# Download the latest pornhub feed and convert to JSON using toptal.com

# convert the feed and download
echo "Downloading latest feed"
curl -s -o pornhub.json https://www.toptal.com/developers/feed2json/convert?url=https://www.pornhub.com/video/webmasterss

# piped output, line-by-line
echo "Extracting information from feed"
cat pornhub.json |jq '.items[] | "\(.url)|\(.title)"'|tr -d "\"" >pornhub.tmp

