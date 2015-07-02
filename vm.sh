#!/bin/bash
# Simple script to start/stop headless vms in virtualbox - By Tim Corcoran

if [ "$1" = "start" ]; then
  vboxmanage startvm $2 --type headless
else

if [ "$1" = 'stop' ]; then
  vboxmanage controlvm $2 poweroff
fi
fi

