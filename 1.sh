#!/bin/bash


while getopts ":ac: :ca: :w: :b: :c: :h" opt;
do
	case $opt in
		c)
			echo 'c triggered'
		;;
		w)
			echo 'w tiggered'
		;;
		b)
			echo 'b triggered'
		;;
		a)
			echo 'a triggered'

		;;
		h)
			echo 'h triggered'
		;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
		;;
		:)
			echo "Parameter required: -$OPTARG" >&2
		;;
	esac
	
done
echo $1
if [ ! $1 = '-h' ]
then
	if [[ ! ${1%% *} == *b* ]]
	then
		echo 'not b'
	else
		echo 'both'
	fi
fi

