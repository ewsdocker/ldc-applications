#!/bin/bash

# =========================================================================
#
#    download and install RipME
#
# =========================================================================

mkdir -p /usr/bin/lms 
mkdir -p /usr/share/ripme

wget "${LMSRIP_URL}"
mv ./ripme.jar /usr/share/ripme/ripme.jar 
chmod +x /usr/share/ripme/ripme.jar 
ln -s /usr/bin/lms/ripme.sh /usr/bin/ripme 
