#!/usr/bin/env bash

# install and/or reload ntp daemon
apt-get update

apt-get -y install ntp
service ntp reload

# setup correct timezone
echo "Europe/Zurich" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# install golang
curl --silent --insecure https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz -O
tar -C /usr/local -xvf go1.5.1.linux-amd64.tar.gz

if [ ! `which go` ]; then
	echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
fi


