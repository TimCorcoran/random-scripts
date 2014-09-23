#!/bin/bash
# Dynamic or custom IP addition to AWS Security group script - By Tim Corcoran 
# A simple script to add your DYNAMIC external IP address to an AWS Security group

DYNIP=`dig +short myip.opendns.com @resolver1.opendns.com`
echo -e "\nWould you like to use your current external IP, $DYNIP? [y/n]\n"
read q1

if [ $q1 == n ] ; then
  echo -e "\nWhat IP would you like to add?\n"
  read custip
fi

echo -e "\nWhat is the security group id you would like to add your IP to?\n"
read secgroupid

echo -e "\nWhat port would you like to add access for?\n"
read port

if [ $q1 == y ] ; then
  echo -e "\n aws ec2 authorize-security-group-ingress --group-id $secgroupid --protocol tcp --port $port --cidr $DYNIP/32 \n"
else
  echo -e "\n aws ec2 authorize-security-group-ingress --group-id $secgroupid --protocol tcp --port $port --cidr $custip/32 \n"
fi

