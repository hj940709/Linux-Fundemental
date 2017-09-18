#!/bin/bash

for arg in $(find $1 -name '*.jpg')
do 
	inputfile=$arg
	prefix=${inputfile%'.jpg'}
	outputfile=$prefix-hipstah.jpg
	convert -sepia-tone 60% +polaroid $inputfile $outputfile
done
