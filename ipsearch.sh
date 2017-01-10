#!/bin/bash
args=1

# 1 аргумент
if 
[[ $# -eq "$args" ]]
then
# аргумент не равен --mac
	if 
	[[ "$1" !=  "--mac" ]]
	then
	dir="$1"
	find "$dir" -type f 2>/dev/null |xargs grep -ouhE "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" 2>/dev/null  |grep -ouE "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"|sort -u |tee ~/IP.log
	else echo "Укажите директорию для поиска! "
	fi
# 2 аргумента
elif [[ $# -eq "2" ]];then
	# если оба аргумента --mac
	if 
	[[ "$1" =  "--mac" && "$2" =  "--mac" ]]
	then
		echo "Usage: ipsearch --mac  directory"
	# если не один из аргументов не  --mac
	elif [[ "$1" !=  "--mac" && "$2" !=  "--mac" ]];then
                echo "Usage: ipsearch --mac  directory"
	# если первый аргумент --mac
	elif [[ "$1" =  "--mac" ]];then
		dir="$2"
		find "$dir" -type f 2>/dev/null |xargs grep -ohuE " ([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2}) " 2> /dev/null |grep -ouE " ([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2}) "|sort -u |tee ~/MAC.log
	# если второй аргумент --mac
	elif [[ "$2" = "--mac" ]];then
		dir="$1"
		find "$dir" -type f 2>/dev/null |xargs grep -ohuE " ([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2}) " 2> /dev/null |grep -ouE " ([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2}) "|sort -u |tee ~/MAC.log
	fi
# все остальное
else
	echo "Usage: ipsearch --mac  directory"
fi
