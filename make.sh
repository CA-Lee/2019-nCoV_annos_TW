#!/bin/sh
echo "start"

git pull

rm ./annos/*
rclone sync gd:buffer/GitHub ./annos --drive-shared-with-me

[ -f "picpack.zip" ] && rm picpack.zip && echo "rm picpack.zip"
cd ./annos
zip ../picpack ./* > /dev/null
cd ..
cp picpack.zip ./archived/`date +%m%d%H%M%S`.zip

echo "`date +%F_%H:%M:%S`: make.sh : Made new picpack.zip.<br>" >> log.html
echo "`date +%F_%H:%M:%S`: make.sh : Contents of picpack.zip : `ls annos/ -1 | tr -s '\n' ' '`<br>" >> log.html
sed -Ei "s/Last update: [0-9]{10}/Last update: `date +%m%d%H%M%S`/g" index.html

git add .
git commit -m "update picpack.zip @ `date +%F_%H:%M:%S`"

git push

echo "done"
exit 0
