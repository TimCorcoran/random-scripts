#! /bin/bash
templaterdp='/Users/beltim/Dropbox/template.rdp'
temporaryRDP='/Users/beltim/Dropbox/temp.rdp'
hostname=${1}

cp -f ${templaterdp} ${temporaryRDP}
sed -i '' "s|verbarrugosa|${hostname}|g" ${temporaryRDP}
open -na /Applications/Microsoft\ Remote\ Desktop.app/Contents/MacOS/Microsoft\ Remote\ Desktop --args /Users/beltim/Dropbox/temp.rdp
