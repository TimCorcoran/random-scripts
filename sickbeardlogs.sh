#!/bin/bash
# Sickbeard log move/append name/store

cd /Applications/SickBeard/Logs/

for file in *; do
    cp -nv -- "$file" /Volumes/Data/Misc/Logs/sickbeard/"$file.$(date +%d%m%Y_%H)"
done
