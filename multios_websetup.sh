#!/bin/bash
#Author:Amos Kambreezy github@kambreezy
#Infrastructure as a Code(IAAC) to automate installation of website on linx environments running different Operating Sysytems
#Variable Declaration
URL="https://www.tooplate.com/zip-templates/2109_the_card.zip"
ART_NAME="2109_the_card"
TEMPDIR="/tmp/webfiles"

yum --help &> /dev/null
#Check the linux OS if its Ubuntu or Centos7
if [ $? -eq 0 ]
then 
 echo "Running Centos"
 PACKAGE="httpd wget unzip"
 SVC="httpd"

 #Install necessary packages
 echo "Install Packages"
 echo "################"
 sudo yum install $PACKAGE -y

 #Activate apache
 systemctl start $SVC
 systemctl enable $SVC
 echo "Install the template"
 echo "###############################"
 mkdir -p $TEMPDIR
 cd $TEMPDIR
 wget $URL
 unzip -o $ART_NAME.zip
 sudo cp -r $ART_NAME/* /var/www/html/

 systemctl restart $SVC
 systemctl status $SVC
else
 echo "Running Ubuntu"
 PACKAGE="apache2 wget unzip"
 SVC="apache2"

  #Install necessary packages
 echo "Install Packages"
 echo "################"
 sudo apt update
 sudo apt install $PACKAGE -y

 #Activate apache2
 systemctl start $SVC
 systemctl enable $SVC
 echo "Install the template"
 echo "###############################"
 mkdir -p $TEMPDIR
 cd $TEMPDIR
 wget $URL
 unzip -o $ART_NAME.zip
 sudo cp -r $ART_NAME/* /var/www/html/

 systemctl restart $SVC
 systemctl status $SVC
 
fi
