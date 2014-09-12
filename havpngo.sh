#!/bin/bash
# A simple script to deploy havpn easily
bundle exec cap puppet:go HOSTFILTER=bpsyd07-dvmh-radius-01.inf.bulletproof.net options="--tags freeradius" role=syd07 && echo "test done, check logs, 10 second delay" && sleep 10 && echo "apply time in 2 seconds" && sleep 2 && bundle exec cap puppet:go HOSTFILTER=bpsyd07-dvmh-radius-01.inf.bulletproof.net options="--tags freeradius" role=syd07 apply=true && bundle exec cap puppet:go HOSTFILTER=bpsyd07-dvmh-radius-02.inf.bulletproof.net options="--tags freeradius" role=syd07 apply=true
