#!/bin/bash
minargs=1
if 
[[ $# -ne $minargs ]]
then
    echo -e "Usage: rsscheck N ,\n       where N is RSS value"

else
    N=$1
    while :
    do
    ps axho rss,pid|awk -v mem=$N '{if ($1 >= mem) print $2}' | xargs kill -15 
    sleep 300
    done
fi &
