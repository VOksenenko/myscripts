#!/bin/bash
if [[ $# -eq 0 ]]; then
        echo -n "Please, specify the directory: "
        read dir
else dir=$1
fi
echo "Processing..."
echo "It could take a while..."
find "$dir"  -type f -exec basename {} \; |grep -vE "^\.[a-ZA-Z0-9]{1,}"|grep -oE "\.[a-ZA-Z0-9]{1,}$"|tr '[:upper:]' '[:lower:]' |sort |uniq -c|awk '{print $2 "-" $1 }'|sort -t- -nk2|sed 's/\.//'
echo "One more thing ..."
find "$dir" -type f -exec basename {} \; |grep -E "^\.[a-ZA-Z0-9]{1,}.+"|sort |uniq -c|awk 'BEGIN {FS = " "} ; {sum+=$1} END {print "Hidden files what start with . - " sum}'


