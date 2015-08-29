#!/usr/bin/env bash

# first make sure there is an ntpd config
if [ ! -e /etc/ntp.conf ]; then
	cat > /etc/ntp.conf << EOS
driftfile /var/lib/ntp/ntp.drift
server 0.pool.ntp.org
server 1.pool.ntp.org
server 2.pool.ntp.org
server pool.ntp.org
EOS
fi

#wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb 
curl --insecure --silent https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb -O
dpkg -i erlang-solutions_1.0_all.deb

apt-get update 
apt-get -y install elixir

