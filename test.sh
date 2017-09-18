#! /bin/bash

. ticktick.sh
string=' {"data":{"id":"lfdqNe0","title":null,"description":null,"datetime":1480721413,"type":"image\/jpeg","animated":false,"width":3186,"height":2338,"size":892575,"views":0,"bandwidth":0,"vote":null,"favorite":false,"nsfw":null,"section":null,"account_url":null,"account_id":0,"is_ad":false,"in_gallery":false,"deletehash":"CpFJNuNY8ZnAGIF","name":"","link":"http:\/\/i.imgur.com\/lfdqNe0.jpg"},"success":true,"status":200}'
tickParse $string
echo ``status``
echo ``data["link"]`` | sed 's/\\//g' 
