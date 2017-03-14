#!/usr/bin/env bash

# install and/or reload ntp daemon
apt-get update

apt-get -y install ntp
service ntp reload

# setup correct timezone
echo "Europe/Zurich" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# install swift
echo Downloading Swift
echo =================

# https://swift.org/builds/swift-3.0-preview-6/ubuntu1510/swift-3.0-PREVIEW-6/swift-3.0-PREVIEW-6-ubuntu15.10.tar.gz
#
branch=development
version=3.0-preview-6
platform=ubuntu15.04
if [ ! -f swift-${version}-${platform}.tar.gz ]; then
	curl --silent --insecure https://swift.org/builds/swift-${version}/ubuntu1510/swift-${version}/swift-${version}-${platform}.tar.gz -O
fi
curl --silent --insecure https://swift.org/builds/swift-${version}/ubuntu1510/swift-${version}/swift-${version}-${platform}.tar.gz.sig -O

echo Verifying signatures
echo ====================
gpg --keyserver hkp://pool.sks-keyservers.net \
	--recv-keys \
	'7463 A81A 4B2E EA1B 551F  FBCF D441 C977 412B 37AD' \
	'1BE1 E29A 084C B305 F397  D62A 9F59 7F4D 21A5 6D5F' \
	'A3BA FD35 56A5 9079 C068  94BD 63BC 1CFE 91D3 06C6'
gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift
gpg --verify swift-${version}-${platform}.tar.gz.sig

echo Installing Swift
echo =============== 
apt-get -y install clang libicu-dev
tar -C /usr/local -xzf swift-${version}-${platform}.tar.gz

if [ ! `which swift` ]; then
	echo "export PATH=\$PATH:/usr/local/swift-${version}-${platform}/usr/bin" >> /etc/profile
fi


