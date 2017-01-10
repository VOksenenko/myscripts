#! /bin/bash
logfile=$1
echo -n "Start date: "
read start
echo -n "End date: "
read end
echo "Log betweeen $start  and $end ... "
cat $logfile | sed -n "/$start/,/$end/p"
