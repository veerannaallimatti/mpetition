#!/bin/bash
FAILED=0
EMAILMESSAGE="./emailmessage.txt"
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
ant -f build.xml > $EMAILMESSAGE
ant clean  >> $EMAILMESSAGE
ant debug > $EMAILMESSAGAE
if [ "$?" = 1 ]; then
    echo "Application failed!"
    FAILED=1
fi
exit $FAILED
 
sudo apt-get install mailutils

SUBJECT="Build started: "
# Email To members
EMAIL="expie00101@gmail.com"
# Email text/message
echo "This is an email message test" >> $EMAILMESSAGE
echo "This is email text" >>$EMAILMESSAGE
# send an email using /bin/mail
/bin/mail -s "$SUBJECT" "$EMAIL" < $EiMAILMESSAGE
