#!/bin/sh
echo "start"
[ -f "picpack.zip" ] && rm picpack.zip && echo "rm picpack.zip"
cd ./annos
zip ../picpack ./* > /dev/null
cd ..
cp picpack.zip ./archived/`date +%m%d%H%M%S`.zip
echo "`date +%F_%H:%M:%S`: make.sh : Made new picpack.zip." >> log.html
echo "`date +%F_%H:%M:%S`: make.sh : Contents of picpack.zip : `ls annos/ -1 | tr -s '\n' ' '`" >> log.html
echo "done"
exit 0
