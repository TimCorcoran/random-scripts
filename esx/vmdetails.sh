#!/bin/bash
# Simple script to get details of a vm on ESX1

if [ ! -z $1 ]; then
  NAME=$1
else
  echo -e "\nServer Name?\n"
  read NAME
fi


if [ -n "$NAME" ]; then
    ssh root@esx1.home.timmyc.com.au vim-cmd vmsvc/getallvms | grep $NAME
else
    ssh root@esx1.home.timmyc.com.au vim-cmd vmsvc/getallvms
fi
