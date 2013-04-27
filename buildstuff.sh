#!/bin/bash
FAILED=0
echo "build started: Displaying the current path"
echo $PATH 
echo "current working directory"
echo `pwd`
ls -al
echo "changing the permission for $ANDROID_HOME"
sudo chmod 777 -R ./android-sdk-linux/
cd ./android-sdk-linux/
ls -al
echo "entering into MPetition"
echo `pwd`
cd ../MPetition
echo `pwd`
echo "Starting the ant to build"
ant -f build.xml
ant clean
#ant debug
if [ "$?" = 1 ]; then
    echo "Application failed!"
    FAILED=1
fi
cd ..
exit $FAILED
