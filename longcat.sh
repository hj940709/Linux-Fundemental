#!/bin/bash

if [[ $1 =~ ^[0-9]+$  ]]	
	then
		if [ $1 -lt 0 ]
			then
				echo 'Invalid Input'
				exit 1
		fi


		if [ $1 -lt 0 ]
			then
				echo 'Invalid Input'
				exit 1
		fi
		if [ $1 -gt 1 ]
			then echo 'Longcat' $1
			else echo 'Shortcat'
		fi

		head -9 shortcat.txt
		for ((i=0 ;i<$1 ;i++))
		do
			echo '  |       |'
		done
		tail -6 shortcat.txt
	else
		echo 'Invalid Input'
		exit 1
fi



