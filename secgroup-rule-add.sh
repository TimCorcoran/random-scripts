#!/bin/bash
# IP addition to AWS Security group script - By Tim Corcoran (TimCorcoran)
# Updated/cleaned - by Stefan Krist (Nerdyness)
# Updated to use aws_sts.sh from asemblage and print a list of current security groupss. - By Tim Corcoran (TimCorcoran) 25/09/14
# Note, this won't work unless you have assemblage and support-scripts in the same directory and this script should probably get moved into assemblage
#
# A simple script to add your CURRENT external IP address (or take user input for IP) into an AWS Security group
#


function aro { $(aws_sts.sh $1 -e); }
function arw { $(aws_sts.sh $1 -e -w); }
export PATH=../../assemblage/aws:${PATH}

echo -e "\nThis script adds an IP address to an AWS Security Group. It uses aws_sts.sh to set customer Access Key details.\n"
echo -e "\nWhat custid are you adding to?\n"
read CUSTID
arw $CUSTID

IP="`dig +short myip.opendns.com @resolver1.opendns.com`"
echo -e "\nAre you adding your current external IP, $IP? [Y/n]\n"
read CUSTOMIP

if [ "$CUSTOMIP" != "y" -a "$CUSTOMIP" != "Y" -a -n "$CUSTOMIP" ]; then
  echo -e "\nWhat IP would you like to add?\n"
  read IP
fi

echo -e "\nWould you like a list of current security groups? [Y/n]\n"
read LISTCUR

if [ "$LISTCUR" == "y" -o "$LISTCUR" == "Y" ] ; then
  aws ec2 describe-security-groups --output table | grep -A 4 Description
fi

echo -e "\nWhat is the security group id you would like to add your IP to?\n"
read SECGROUPID

echo -e "\nWhat port would you like to add access for?\n"
read PORT

aws ec2 authorize-security-group-ingress --group-id $SECGROUPID --protocol tcp --port $PORT --cidr $IP/32

if [ "$?" == "0" ]; then
  echo -e "\nSuccess! Printing current list of rules in $SECGROUPID\n"
    sleep 3
    aws ec2 describe-security-groups --group-ids $SECGROUPID --output table
else
  echo -e "\nThis has failed!\n"
fi

exit

