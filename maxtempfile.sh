#!/bin/bash

maxfile=$1/00:00/hp-temps.txt
prev_value=$(grep 'PROCESSOR_ZONE' $maxfile |rev|cut -c 13-21|rev|cut -d 'C' -f 1)
curr_value=$(grep 'PROCESSOR_ZONE' $maxfile |rev|cut -c 13-21|rev|cut -d 'C' -f 1)
for arg in $(find $1 -name 'hp-temps.txt')
do 
	if [ -f $arg ]
	then
		curr_value=$(grep 'PROCESSOR_ZONE' $arg |rev|cut -c 13-21|rev|cut -d 'C' -f 1)
	fi
	if [ $prev_value -lt $curr_value ]
	then
		maxfile=$arg
		prev_value=$(grep 'PROCESSOR_ZONE' $arg |rev|cut -c 13-21|rev|cut -d 'C' -f 1)
	fi
done

echo $maxfile
