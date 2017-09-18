#! /bin/bash
max=0
min=100
find $1 -name hp-temps.txt -exec grep "PROCESSOR_ZONE" {} +|while read location sensor temp threshold
do
	curr_date=${location:0-32:10}
	curr_time=${location:0-21:5}
	curr_temp=${temp%%C*}
	if [ $max -lt $curr_temp ]
	then
		max=$curr_temp
		echo 'New Max:'$curr_date $curr_time $curr_temp
	fi
	if [ $min -gt $curr_temp ]
        then
                min=$curr_temp
                echo 'New Min:'$curr_date $curr_time $curr_temp
        fi

done
