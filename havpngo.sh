#!/bin/bash
# A simple script to deploy havpn easily
echo -e "\nThis will first do a noop run on radius-01, sleep, then do an apply run of radius-01, then 02\n"
bundle exec cap puppet:go HOSTFILTER=bpsyd07-dvmh-radius-01.inf.bulletproof.net options="--tags freeradius" role=syd07 
echo -e "\nNoop run on radius-01 complete. Check above output for any errors, and if needed CTRL + C in next 10 seconds\n" 
sleep 10 
echo -e "\nLast chance before apply run!\n" 
sleep 2 
echo -e "\nOk, apply time\n"
bundle exec cap puppet:go HOSTFILTER=bpsyd07-dvmh-radius-01.inf.bulletproof.net options="--tags freeradius" role=syd07 apply=true 
bundle exec cap puppet:go HOSTFILTER=bpsyd07-dvmh-radius-02.inf.bulletproof.net options="--tags freeradius" role=syd07 apply=true
echo -e "\nDone\nEnsure there are no errors in above output\n"
