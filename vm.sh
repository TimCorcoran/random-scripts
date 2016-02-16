#!/bin/bash
# Simple script to spin up new servers on ESX1


if [ ! -z $1 ]; then
  NAME=$1
else
  echo -e "\nNew Server Name?\n"
  read NAME
fi

if [ ! -z $2 ]; then
  VLAN=$2
else
  echo -e "\nWhich VLAN? (For VLAN1 enter LAG)\n"
  read VLAN
fi

echo -e "\nProduction? or Testing\n"
  read RGROUP

/Applications/VMware\ OVF\ Tool/ovftool -ds=LOCAL-DS --net:"LAG=$VLAN" --name=$NAME --powerOn --X:waitForIp "https://ovfdeploy:Quack123Quack!@esx1.home.timmyc.com.au/folder/Ubuntu%2fUbuntuOVF/UbuntuOVF.ovf?dcPath=ha%252ddatacenter&dsName=LOCAL%252dDS" "vi://ovfdeploy:Quack123Quack!@esx1.home.timmyc.com.au/$RGROUP/"
