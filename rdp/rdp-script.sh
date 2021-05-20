#! /bin/bash
rdpTemplateFile='/Users/beltim/tc-repos/random-scripts/rdp/template.rdp'
rdpTempRDP='/Users/beltim/tc-repos/random-scripts/rdp/temp.rdp'
rdpRunCommand="/Applications/Microsoft\ Remote\ Desktop\ Beta.app/Contents/MacOS/Microsoft\ Remote\ Desktop\ Beta"
rdpHost=${1}

if [ "${2}" = "/console" ] ; then
    rdpHost="${rdpHost} /console";
    echo "rdpHost is: " ${rdpHost}
fi

if [ "${2}" = "-console" ] ; then
    rdpHost="${rdpHost} /console";
    echo "rdpHost is: " ${rdpHost}
fi

if [ "${2}" = "-admin" ] ; then
    rdpHost="${rdpHost} /console";
    echo "rdpHost is: " ${rdpHost}
fi

cp -f ${rdpTemplateFile} ${rdpTempRDP}

sed -i '' "s|verbarrugosa|${rdpHost}|g" ${rdpTempRDP}

open -na "${rdpRunCommand}" --args ${rdpTempRDP}
