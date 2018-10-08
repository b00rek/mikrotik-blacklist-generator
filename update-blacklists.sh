#!/bin/sh
saveTo=.
exportTo=/var/www
now=$(date);

rm -f $saveTo/dshield.txt $saveTo/spamhausdrop.txt $saveTo/spamhausedrop.txt $saveTo/malc0de.txt $saveTo/blocklistde.txt

wget -q -O - http://feeds.dshield.org/block.txt | awk --posix '/^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.0\t/ { print $1 "/24" ;}' > $saveTo/dshield.txt
wget -q -O - http://www.spamhaus.org/drop/drop.txt | awk --posix '/^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\// { print $1 ;}' > $saveTo/spamhausdrop.txt
wget -q -O - http://www.spamhaus.org/drop/edrop.txt | awk --posix '/^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\// { print $1 ;}' > $saveTo/spamhausedrop.txt
wget -q -O - http://malc0de.com/bl/IP_Blacklist.txt | awk --posix '/^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/ { print $1 ;}' > $saveTo/malc0de.txt
wget -q -O - http://lists.blocklist.de/lists/all.txt | awk --posix '/^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/ { print $1 ;}' > $saveTo/blocklistde.txt

cat $saveTo/dshield.txt $saveTo/spamhausdrop.txt $saveTo/spamhausedrop.txt $saveTo/malc0de.txt $saveTo/blocklistde.txt > $saveTo/all.txt

cat $saveTo/all.txt | $saveTo/cidr-convert.bin > $saveTo/all-minified.txt

echo "# Generated on $now" > $exportTo/z_blacklist.rsc
echo "/ip firewall address-list" >> $exportTo/z_blacklist.rsc
cat $saveTo/all-minified.txt | awk --posix '/^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/ { print ":do {add list=z_blacklist address=" $1 " timeout=3d} on-error={set [find list=z_blacklist address=" $1 "] timeout=3d}";}' >> $exportTo/z_blacklist.rsc
