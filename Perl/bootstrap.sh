#!/usr/bin/env bash

# install and/or reload ntp daemon
apt-get update

apt-get -y install ntp
service ntp reload

# setup correct timezone
echo "Europe/Zurich" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# install prerequisites
apt-get -y install git

# install perl
# nothing to do here...

# install perl6
git clone https://github.com/tadzik/rakudobrew /home/vagrant/.rakudobrew
export PATH=/home/.rakudobrew/bin:$PATH

rakudobrew build moar 2015.12
rakudobrew build panda


