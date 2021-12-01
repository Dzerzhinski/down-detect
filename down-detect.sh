#! /bin/bash

logfile=down-detect.log
touch $logfile

ping -c1 -w2 8.8.8.8
if [ $? -eq 0 ] 
then 
	status="UP"
else 
	status="DOWN"
fi

past_state=`tail --lines=1 $logfile | grep -o "^\(UP\|DOWN\)"`

if [ "$status" != "$past_state" ]
then
	echo "$status	$(date)" >> $logfile
fi

