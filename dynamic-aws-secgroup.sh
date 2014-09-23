#!/bin/bash
# A simple script to add your DYNAMIC external IP address to an AWS Security group

# Get your current external IP address
dig +short myip.opendns.com @resolver1.opendns.com

# Example of a rule to add rule
aws ec2 authorize-security-group-ingress --group-id sg-903004f8 --protocol tcp --port 3389 --cidr 203.0.113.0/24

# Example of a rule to remove rule
aws ec2 authorize-security-group-egress --group-id sg-903004f8 --protocol tcp --port 3389 --cidr 203.0.113.0/24
