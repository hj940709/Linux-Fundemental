#!/bin/bash

echo $RANDOM $RANDOM>random-data.txt
for((i=1;i<$1;i++))
do
	echo $RANDOM $RANDOM>>random-data.txt
done
