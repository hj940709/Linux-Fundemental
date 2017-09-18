#!/bin/bash

time=${1:0-7:7}
year=${time:0:4}
month=${time:0-2:2}
path=${1%%$time}
touch temp-max-min-$year-$month.txt
startdate=$(date -d"$year-$month-01 00:00:00" +%s)
enddate=$(date -d"$year-$((month+1))-01 00:00:00" +%s)

for ((i=startdate;i<enddate;i=i+86400))
do
	date=$(date -d @$i +%Y/%m/%d)
	max_value=0
	curr_value=0
	min_value=100
	if [ ! -e $path$date ]
	then
		continue
	fi
	for arg in $(find $path$date -name 'hp-temps.txt')
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
	echo $date $max_value $min_value >>temp-max-min-$year-$month.txt
done

echo 'set terminal postscript eps enhanced;
set out "min-max-temps-'$year-$month'.eps";
set xdata time;set timefmt "%Y/%m/%d";
set format x "%Y/%m/%d";set xlabel "Date\nTime";
set ylabel "Tempreature";
set title " Maximum and Minimun Temperatures for each day of '$year/$month'";
set xrange ["'$year/$month'/01":"'$year/$((month+1))'/01"];
plot "temp-max-min-'$year-$month'.txt" using 1:2 title "Max" with linespoints ,"temp-max-min-'$year-$month'.txt" using 1:3 title "Min" with linespoints ;'|gnuplot

rm ./temp-max-min-$year-$month.txt

