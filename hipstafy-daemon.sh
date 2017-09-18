#! /bin/bash

case $1 in
start)
	pid=''
	if [  -e ~/LinuxFundamentals2015/Week5/pidfile.txt ]
	then		
		pid=$(cat ~/LinuxFundamentals2015/Week5/pidfile.txt)
		kill -0 $pid
		if [ ! $? -eq 0 ]
		then
			nohup ~/LinuxFundamentals2015/Week5/hipstafy-wait.sh & 1>log.out 2>log.err
			echo $! > ~/LinuxFundamentals2015/Week5/pidfile.txt
			echo 'Started'
		else
			echo 'Running...'
		fi
	else
		nohup ~/LinuxFundamentals2015/Week5/hipstafy-wait.sh & 1>log.out 2>log.err
		echo $! > ~/LinuxFundamentals2015/Week5/pidfile.txt
		echo 'Started'
	fi	
;;
stop)
	if [  -e ~/LinuxFundamentals2015/Week5/pidfile.txt ]
	then
		pid=$(cat ~/LinuxFundamentals2015/Week5/pidfile.txt)
		kill -0 $pid
		if [ $? -eq 0 ]
		then
			pkill -P $pid
			if [  -e ./nohup.out ]
			then
				rm ./nohup.out
			fi
			rm ~/LinuxFundamentals2015/Week5/pidfile.txt
			rm ./log.out
			rm ./log.err
			echo 'Stopped'
		else
			echo 'Already Stopped'
		fi
	else
		echo 'Not Running at all .....'	
	fi
;;
restart)
	if [  -e ~/LinuxFundamentals2015/Week5/pidfile.txt ]
	then
		pid=$(cat ~/LinuxFundamentals2015/Week5/pidfile.txt)
		kill -0 $pid
		if [ $? -eq 0 ]
		then
			pkill -P $pid
			if [  -e ./nohup.out ]
			then
				rm ./nohup.out
			fi
			rm ~/LinuxFundamentals2015/Week5/pidfile.txt
			rm ./log.out
			rm ./log.err
			echo 'Stopped'
			nohup ~/LinuxFundamentals2015/Week5/hipstafy-wait.sh & 1>log.out 2>log.err
			echo $! > ~/LinuxFundamentals2015/Week5/pidfile.txt
			echo 'Started'
		else
			echo 'Already Stopped'
		fi
	else
		echo 'Not Running at all .....'	
	fi
;;
status)
	if [  -e ~/LinuxFundamentals2015/Week5/pidfile.txt ]
	then
		pid=$(cat ~/LinuxFundamentals2015/Week5/pidfile.txt)
		kill -0 $pid
		if [ $? -eq 0 ]
		then
			echo 'Statue:Running...'
		else
			echo 'Statue:Stopped'
		fi
	else
		echo 'Statue:Stopped'	
	fi
;;

*)
	echo "Invalid Option"
;;
esac



