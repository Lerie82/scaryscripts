#!/bin/bash
# Lerie Taylor 2023
# scarylerie@gmail.com

# revisions:
#	08-16-2023: edited dig command

# This will serve up some DNS records for a domain name
#
# $ ./dig-domain.sh google.ch
# google.ch.              300     IN      A       142.250.188.227
# google.ch.              300     IN      AAAA    2607:f8b0:4007:80a::2003
# google.ch.              300     IN      MX      0 smtp.google.com.
# google.ch.              21600   IN      NS      ns4.google.com.
# google.ch.              21600   IN      NS      ns1.google.com.
# google.ch.              21600   IN      CAA     0 issue "pki.goog"
# google.ch.              21600   IN      NS      ns3.google.com.
# google.ch.              21600   IN      NS      ns2.google.com.
# google.ch.              300     IN      TXT     "v=spf1 -all"
# google.ch.              60      IN      SOA     ns1.google.com. dns-admin.google.com. 554750970 900 900 1800 60

if [ -z $1 ]
then
	echo "You must supply a domain name. ($0 example.com)"
	exit 1
fi

DOMAIN=$1
dig $DOMAIN any +nocomments
dig $DOMAIN any txt +nocomments
