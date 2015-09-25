#!/usr/bin/env bash


# install and/or reload ntp daemon
apt-get -y install ntp
service ntp reload

# setup correct timezone
echo "Europe/Zurich" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

#wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb 
curl --insecure --silent https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb -O
dpkg -i erlang-solutions_1.0_all.deb

apt-get update 
apt-get -y install elixir

# git version management
apt-get -y install git

