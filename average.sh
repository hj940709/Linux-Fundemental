#! /bin/bash

exp=0
for arg in $*
do
	if [[ $arg =~ ^[-,0-9,.,0-9]+$  ]]
	then
		exp=$exp'+'$arg
	else
		echo 'Input Error'
		exit 1
	fi
done
exp='('$exp')/'$#
echo 'scale=2;'$exp|bc
