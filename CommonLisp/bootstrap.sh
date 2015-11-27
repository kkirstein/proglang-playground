#!/usr/bin/env bash

# install and/or reload ntp daemon
apt-get update

apt-get -y install ntp
service ntp reload

# setup correct timezone
echo "Europe/Zurich" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# install CCL
echo Installing CCL
echo ==============
curl --silent --insecure ftp://ftp.clozure.com/pub/release/1.11/ccl-1.11-linuxx86.tar.gz -O
tar -C /usr/local -xf ccl-1.11-linuxx86.tar.gz

if [ ! `which ccl` ]; then
	echo 'export CCL_DEFAULT_DIRECTORY=/usr/local/ccl' >> /etc/profile
	echo 'export PATH=$PATH:/usr/local/ccl/scripts' >> /etc/profile
fi
echo done

