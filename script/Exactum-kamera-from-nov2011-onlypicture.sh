#!/bin/bash

for((j=11;j<13;j++))
do
	ls -R /cs/home/tkt_cam/public_html/2011/$j/|grep .jpg>>exactum-kamera-from-nov2011-report.txt
done
for (( i=2012;i<`date +%Y`+1;i ++))
do
	ls -R /cs/home/tkt_cam/public_html/$i/|grep .jpg>>exactum-kamera-from-nov2011-report.txt
done
