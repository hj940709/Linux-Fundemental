#!/bin/bash

sdir="/cs/home/tkt_cam/public_html/`date +%Y`/`date +%m`/`date +%d`/";
tdir="~/LinuxFundamentals2015/Week1/`date +%A.%Y.%m.%d`";
rsync --archive --stats $sdir $tdir
echo "rsync --archive --stats $sdir $tdir";
