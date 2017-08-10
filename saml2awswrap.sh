#!/bin/bash
# Quick and dirty wrapper for saml2aws


if [ ! -z $1 ]; then
  CUSTID=$1
else
  echo -e "\nCustomer ID?\n"
  read CUSTID
fi

if [ ! -z $2 ]; then
  MFA=$2
else
  echo -e "\nMFA Token\n"
  read MFA
  fi

~/saml2aws -c $CUSTID -r bp-saml-rw -m $MFA
   