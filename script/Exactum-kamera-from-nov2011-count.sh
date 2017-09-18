#!/bin/bash --login

a=0

for((j=11;j<13;j++))
do
	((a = $a + `ls -R /cs/home/tkt_cam/public_html/2011/$j/|grep .jpg|wc -l`))
done
for (( i=2012;i<`date +%Y`+1;i ++))
do
	((a = $a + `ls -R /cs/home/tkt_cam/public_html/$i/|grep .jpg|wc -l`))
done

echo $a
