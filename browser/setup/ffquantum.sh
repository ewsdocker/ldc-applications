#!/bin/bash

echo
echo "*********** ffquantum stable ***********"
echo

apt-get update
apt-get -y install \
               gvfs \
               gvfs-bin \
               libaacs0 \
               libcanberra0 \
               libcanberra-gtk0 \
               libcanberra-gtk-module \
               libcanberra-pulse \
               libevent-2.0-5 \
               libevent-pthreads-2.0-5 \
               libnspr4 \
               libnss3 \
               libv4l-0 \
               libx11-protocol-perl 

wget ${FFOX_URL} 
tar -xvf ${FFOX_PKG} -C /opt 
rm ${FFOX_PKG}

ln -s /opt/firefox/firefox /usr/bin/firefox 
chmod 775 /opt/firefox/firefox 

echo
echo "****************************************"
echo
