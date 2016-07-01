#!/usr/bin/env bash

#add-apt-repository 'deb http://ppa.launchpad.net/avsm/ocaml42+opam12/ubuntu trusty main '
#add-apt-repository 'deb-src http://ppa.launchpad.net/avsm/ocaml42+opam12/ubuntu trusty main '
add-apt-repository ppa:avsm/ppa

apt-get update

# install and/or reload ntp daemon
apt-get -y install ntp
service ntp reload

# setup correct timezone
echo "Europe/Zurich" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# install deps
apt-get -y install git
#apt-get -y install opam
