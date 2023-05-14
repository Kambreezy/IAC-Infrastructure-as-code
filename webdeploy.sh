#!/bin/bash
#Author:Amos Kambreezy github@kambreezy

#Set the user variable
USR='devops'
##Install the dependencies to the list of host environments
for host in `cat remhosts`
do 
 echo "#######################"
 echo "Connecting to $host"
 #copy script to another server
 scp multios_websetup.sh $USR@$host:/tmp/
 #initialize the installation process by running the script
 ssh $USR@$host sudo /tmp/multios_websetup.sh
 ssh $USR@$host sudo rm -rf /tmp/multios_websetup.sh
done
