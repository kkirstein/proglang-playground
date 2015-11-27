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

# configure quicklisp
echo Installing QUICKLISP
echo ====================
curl --silent --insecure http://beta.quicklisp.org/quicklisp.lisp -O /vagrant/qicklisp.lisp
if [ ! -f /home/vagrant/.config/common-lisp/source-registry.conf.d/asdf2.conf ]; then
	mkdir -p /home/vagrant/.config/common-lisp/source-registry.conf.d
	echo '(:tree "/vagrant")' > /home/vagrant/.config/common-lisp/source-registry.conf.d/asdf2.conf
fi
echo "QUICKLISP Installed:"
echo "Install with:    (quicklisp-quickstart:install)"
echo "Setup CL:        (ql:add-to.init-file)"
echo "Search packages: (ql:apropos \"package\")"
echo "Load package:    (ql:quickload \"package\")"


