#!/bin/bash
SGlimit=150
rm ip-ranges.json
wget -q https://ip-ranges.amazonaws.com/ip-ranges.json
CIDR=`jq -r '.prefixes[] | select(.service=="CLOUDFRONT") | .ip_prefix' 
< ip-ranges.json | wc -l`
if (( "$CIDR" < "$SGlimit" ));
then
    echo -e "\e[32mNot fucked yet"
else
    echo -e "\e[31mWell fucked";
fi;
echo
echo "Current numer of CIDRs $CIDR"
echo "SG Limit $SGlimit"
