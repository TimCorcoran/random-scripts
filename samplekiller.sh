#!/bin/bash
# THE SAMPLE KILLER 1.0 by Tim Corcoran
# Finds all files with sample (but not sampler) in name and puts the list


touch /volume2/Data/samplekiller.txt;
chmod 777 /volume2/Data/samplekiller.txt;

find /volume2/Data/Multimedia/TV/ -name '*sample*.*' | grep -v sampler > /volume2/Data/samplekiller.txt;
find /volume2/Data/Multimedia/TV/ -name '*Sample*.*' | grep -v Sampler >> /volume2/Data/samplekiller.txt;
find /volume2/Data/Multimedia/TV/ -name '*SAMPLE*.*' | grep -v SAMPLER >> /volume2/Data/samplekiller.txt;
find /volume2/Data/Multimedia/Movies/ -name '*sample*.*' | grep -v sampler >> /volume2/Data/samplekiller.txt;
find /volume2/Data/Multimedia/Movies/ -name '*Sample*.*' | grep -v Sampler >> /volume2/Data/samplekiller.txt;
find /volume2/Data/Multimedia/Movies/ -name '*SAMPLE*.*' | grep -v SAMPLER >> /volume2/Data/samplekiller.txt;

while read -r line
do
 rm "$line"
done < "/volume2/Data/samplekiller.txt"

mv /volume2/Data/samplekiller.txt /volume2/Data/Misc/Logs/samplekiller/"`date +%d%m%Y_%H`_sampleskilled.txt";

exit

