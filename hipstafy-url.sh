#! /bin/bash

#Authorization: Client-ID 405ee3a207a556f
#url:https://api.imgur.com/3/image
. ticktick.sh
wget -q $1 -O temp
echo "Download Complete"
if ! file -b ./temp | grep -q "image" 
then
	echo "Not Image File"
	exit 1
fi
convert -sepia-tone 60% +polaroid temp temp2.jpg
echo "Convert Complete"
string=$(curl -i -H "Authorization: Client-ID 405ee3a207a556f" -H "Accept: application/json" -F "image=@temp2.jpg" "https://api.imgur.com/3/image")
json="{"${string#*"{"}

tickParse $json

if [ ``status`` -eq 200 ]
then
	echo "Upload Successed"
	echo "New URL Address:" ``data["link"]`` | sed 's/\\//g'
else
	echo "Upload Failed"
fi
rm ./temp
rm ./temp2.jpg
