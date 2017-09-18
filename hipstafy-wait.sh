#! /bin/bash

inotifywait -mq ~/LinuxFundamentals2015/Week5/hipstafy-dropbox -e MOVED_TO -e create|while read location event filename 
do	
	if [[ $filename =~ ['.jpg','.png','.jpeg','.bmp']+$  ]]
	then	
		inputfile=$location$filename
		prefix=${filename%'.'*}
		outputfile=$prefix-hipstah.jpg
		echo $inputfile,$prefix,$outputfile
		convert -sepia-tone 60% +polaroid $inputfile ~/LinuxFundamentals2015/Week5/hipstafy-dropbox/hipstafied/$outputfile
	fi
	
done 
