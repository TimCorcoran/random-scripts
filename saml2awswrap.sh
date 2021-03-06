#!/bin/bash
# Quick and dirty wrapper for saml2aws


if [ ! -z $1 ]; then
  CUSTID=$1
else
  echo -e "\nCustomer ID?\n"
  read CUSTID
fi

export AWS_PROFILE=$CUSTID
~/saml2aws --clientid bulletproof --role bp-saml-rw --login tim.corcoran --timeout 43200 --disable-cred-cache --write-credentials --profile=$CUSTID

