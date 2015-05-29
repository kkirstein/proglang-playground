#!/usr/bin/env bash

# setup repo for pony and install compiler
wget -O - http://www.ponylang.org/releases/buildbot@lists.ponylang.org.gpg.key | apt-key add -

add-apt-repository "deb http://ponylang.org/releases/apt ponyc main"
add-apt-repository "deb http://ponylang.org/releases/apt ponyc-avx2 main"
add-apt-repository "deb http://ponylang.org/releases/apt ponyc-numa main"

apt-get update

apt-get install ponyc

# install ruby dev environment
apt-get -y install ruby-dev

# install rust compiler
#curl -sf -L https://static.rust-lang.org/rustup.sh | sh
curl --insecure -L https://static.rust-lang.org/rustup.sh -O
# this must be called interactively
#sh rustup.sh --disable-sudo

