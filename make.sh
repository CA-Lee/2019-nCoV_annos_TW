#!/bin/sh
echo "start"
[ -f "picpack.zip" ] && rm picpack.zip && echo "rm picpack.zip"
cd ./annos
zip ../picpack ./* > /dev/null
echo "done"
exit 0
