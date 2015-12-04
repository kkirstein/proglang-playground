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
version=2.2-SNAPSHOT-2015-12-01-b
platform=ubuntu14.04
if [ ! -f swift-${version}-${platform}.tar.gz ]; then
	curl --silent --insecure https://swift.org/builds/ubuntu1404/swift-${version}/swift-${version}-${platform}.tar.gz -O
fi
curl --silent --insecure https://swift.org/builds/ubuntu1404/swift-${version}/swift-${version}-${platform}.tar.gz.sig -O

echo Verifying signatures
echo ====================
gpg --keyserver hkp://pool.sks-keyservers.net \
	--recv-keys \
	'7463 A81A 4B2E EA1B 551F  FBCF D441 C977 412B 37AD' \
	'1BE1 E29A 084C B305 F397  D62A 9F59 7F4D 21A5 6D5F'
gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift
gpg --verify swift-${version}-${platform}.tar.gz.sig

echo Installing Swift
echo ================
apt-get -y install clang
tar -C /usr/local -xzf swift-${version}-${platform}.tar.gz

if [ ! `which swift` ]; then
	echo "export PATH=\$PATH:/usr/local/swift-${version}-${platform}/usr/bin" >> /etc/profile
fi


