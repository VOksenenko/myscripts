#!/bin/bash
while read line; do ping -c$2 -i$3 "$line";  done < $1
