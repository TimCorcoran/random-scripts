#! /bin/bash
templaterdp='/Users/beltim/Dropbox/template.rdp'
temporaryRDP='/Users/beltim/Dropbox/temp.rdp'
command="/Applications/MicrosoftRemoteDesktop.app/Contents/MacOS/Microsoft Remote Desktop"
hostname=${1}

cp -f ${templaterdp} ${temporaryRDP}
sed -i '' "s|verbarrugosa|${hostname}|g" ${temporaryRDP}
open -na "${command}" --args ${temporaryRDP}
