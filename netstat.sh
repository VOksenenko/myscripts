#!/bin/bash
echo `date +%Y-%m-%d:%H:%M:%S`|tee -a ip.log
start=`ip -s a show dev enp2s0 |sed '1,6d' | awk '(NR %2 == 0){print$1}' `
#echo $start
startRX=`echo $start | awk '{print$1}'`
startTX=`echo $start | awk '{print$2}'`

echo "Received: $startRX" |tee -a ip.log
echo "Transmitted: $startTX" |tee -a ip.log
echo | tee -a ip.log
sleep 10

while :
do
echo `date +"%T"`| tee -a ip.log
current=`ip -s a show dev enp2s0 |sed '1,6d' | awk '(NR %2 == 0){print$1}' `
currentRX=`echo $current | awk '{print$1}'`
currentTX=`echo $current | awk '{print$2}'`

deltaRX=`echo |awk -v currentRX=$currentRX prevRX=$startRX'{
deltaRX = currentRX - prevRX
print deltaRX
}'`
echo "deltaRX: $deltaRX" |tee -a ip.log

deltaTX=`echo |awk -v currentTX=$currentTX prevTX=$startTX'{
deltaTX = currentTX - prevTX
print deltaTX
}'`
echo "deltaTX: $deltaTX" |tee -a ip.log
startRX=$currentRX
startTX=$currentTX
sleep 10
echo |tee -a ip.log
done
