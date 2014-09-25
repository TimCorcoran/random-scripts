#!/bin/bash
# IP addition to AWS Security group script - By Tim Corcoran (TimCorcoran)
# Updated/cleaned by Stefan Krist (Nerdyness)
# A simple script to add your CURRENT external IP address (or take user input for IP) into an AWS Security group

echo -e "\nThis script adds an IP address to an AWS Security Group. You should first have configured AWS Access Keys (either manually, or using aws_sts).\n"
IP="`dig +short myip.opendns.com @resolver1.opendns.com`"
echo -e "\nAre you adding your current external IP, $IP? [Y/n]\n"
read CUSTOMIP

if [ "$CUSTOMIP" != "y" -a "$CUSTOMIP" != "Y" -a -n "$CUSTOMIP" ]; then
  echo -e "\nWhat IP would you like to add?\n"
  read IP
fi

echo -e "\nWhat is the security group id you would like to add your IP to?\n"
read SECGROUPID

echo -e "\nWhat port would you like to add access for?\n"
read PORT

aws ec2 authorize-security-group-ingress --group-id $SECGROUPID --protocol tcp --port $PORT --cidr $IP/32
