#!/bin/bash
echo "Checking..."
echo "It could take a while..."
while read line; do 
prct=`ping -c$2 -i$3 "$line" |sed -e '$!{h;d;}' -e x|awk '{print $6}'`
echo "$line : $prct loss"
done < $1
