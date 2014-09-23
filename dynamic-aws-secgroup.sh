#!/bin/bash
# Dynamic or custom IP addition to AWS Security group script - By Tim Corcoran
# Updated/cleaned by Nerdyness
# A simple script to add your DYNAMIC external IP address to an AWS Security group


IP="`dig +short myip.opendns.com @resolver1.opendns.com`"
echo -e "\nWould you like to use your current external IP, $IP? [Y/n]\n"
read CUSTOMIP

if [ "$CUSTOMIP" != "y" -a "$CUSTOMIP" != "Y" -a -n "$CUSTOMIP" ]; then
  echo -e "\nWhat IP would you like to add?\n"
  read IP
fi

echo -e "\nWhat is the security group id you would like to add your IP to?\n"
read SECGROUPID

echo -e "\nWhat port would you like to add access for?\n"
read PORT

echo -e "\n aws ec2 authorize-security-group-ingress --group-id $SECGROUPID --protocol tcp --port $PORT --cidr $IP/32 \n"
