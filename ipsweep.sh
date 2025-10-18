#!/bin/bash

#Here we use if statement to check if input equals nothing. If it does then print the two error messages. Else move on.

if [ "$1" == "" ]
then
echo 'You forgot the ip Address!'
echo 'Syntax: ./ipsweep.sh 192.168.4'
else

#Here we create a for loop named ip for a sequence counting 1-254

for ip in  `seq 1 254`; do

#Here we send one ping to our input arugument 1 (the ip we enter after the .sh) as ./ipsweep.sh is argument 0 followed by the sequence 
#loop 1-254 and grep the line we need. Then we use cut and specify a deliniator as a space. It counts four spaces into the line and
#greps the word right before it. Then we use translate to get rid of the : so we have just the ip address. Next we use & to run the
#command all at once instead of ; which would run the sequence one at a time.

ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 |tr -d ":" &
done
fi
