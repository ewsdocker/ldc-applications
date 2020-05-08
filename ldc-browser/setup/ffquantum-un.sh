#!/bin/bash

echo
echo "********** ffquantum unstable **********"
echo

echo "**** moving scripts ****"
echo

mv /tmp/99defaultrelease /etc/apt/apt.conf.d/99defaultrelease
mv /tmp/unstable.list /etc/apt/sources.list.d/unstable.list

chmod 644 /etc/apt/apt.conf.d/99defaultrelease
chmod 644 /etc/apt/sources.list.d/unstable.list

echo
echo "**** installing firefox ****"
echo

apt-get update
apt-get -t unstable install -y firefox

echo
echo "****************************************"
echo
