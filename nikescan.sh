#!/bin/bash
# This is a script to scan add-to-cart nikestore.com.au links to map the product IDs to actual products and SKUs
# Can be run by providing start/stop points as; nikescan.sh START STOP
# If no start/stop is given at initial execution it will ask for start/stop points


TEMPFILE=/tmp/$$.tmp

if [ ! -z $1 ]; then
  START=$1
else
  echo "What number would you like to start at? NNNNN"
  read START
fi

if [ ! -z $2 ]; then
  STOP=$2
else
  echo "What number would you like to stop at? NNNNN"
  read STOP
fi

echo $START > $TEMPFILE
OUTPUTFILE="$START-$STOP.txt"

echo NEW-FILE > $OUTPUTFILE

	COUNTER=$(cat $TEMPFILE)
		while [  $COUNTER -lt $STOP ]; do
			echo Product ID $(printf "%05d " $COUNTER) >> $OUTPUTFILE
			curl -IL http://www.nikestore.com.au/checkout/cart/add/uenc/aHR0cHM6Ly93d3cubmlrZXN0b3JlLmNvbS5hdS93aXNobGlzdC8_X19fU0lEPVM/product/$(printf "%05d " $COUNTER) | grep Location | grep -v checkout >> $OUTPUTFILE
		let COUNTER=COUNTER+1 
	done
