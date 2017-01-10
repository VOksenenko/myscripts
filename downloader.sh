#!/bin/bash
file=$1
until [[ `curl -Is $file | head -1|awk '{print$2}'` -eq 200 ]];
do
curl -Is $file
sleep 5
done
wget -nc -P ~/ $file




