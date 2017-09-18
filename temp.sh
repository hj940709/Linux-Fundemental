#!/bin/bash
cat /dev/null > temp-max-min.txt
startdate=$(date -d"2011-11-01 00:00:00" +%s)
enddate=$(date -d"2011-12-01 00:00:00" +%s)
for((i=startdate;i<enddate;i=i+86400))
do
	date=$(date -d @$i +%Y.%m.%d)
	init_value=$(grep 'PROCESSOR_ZONE' $1/$date/00:00/hp-temps.txt |rev|cut -c 13-21|rev|cut -d 'C' -f 1)
	max_value=$init_value
	curr_value=$init_value
	min_value=$init_value
	for arg in $(find $1/$date -name 'hp-temps.txt')
	do 
		if [ -f $arg ]
		then
			curr_value=$(grep 'PROCESSOR_ZONE' $arg |rev|cut -c 13-21|rev|cut -d 'C' -f 1)
		fi
		if [ $max_value -lt $curr_value ]
		then
			max_value=$(grep 'PROCESSOR_ZONE' $arg |rev|cut -c 13-21|rev|cut -d 'C' -f 1)
		fi
		if [ $min_value -gt $curr_value ]
		then
			min_value=$(grep 'PROCESSOR_ZONE' $arg |rev|cut -c 13-21|rev|cut -d 'C' -f 1)
		fi
	done
	echo $date $max_value $min_value
	echo $date $max_value $min_value >>temp-max-min.txt
done

