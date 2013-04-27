#!/bin/bash
FAILED=0
echo "build started: Path variable value "
echo $PATH 
echo `pwd`
ls -al
sudo chmod 777 -R ./android-sdk-linux/
cd ./android-sdk-linux/
ls -al
cd ../MPetition
ant -f build.xml
ant clean
ant debug
if [ "$?" = 1 ]; then
    echo "Application failed!"
    FAILED=1
fi
cd ..
exit $FAILED
