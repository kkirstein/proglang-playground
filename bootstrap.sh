#!/usr/bin/env bash

# setup repo for pony and install compiler
wget -O - http://www.ponylang.org/releases/buildbot@lists.ponylang.org.gpg.key | apt-key add -

add-apt-repository "deb http://ponylang.org/releases/apt ponyc main"
add-apt-repository "deb http://ponylang.org/releases/apt ponyc-avx2 main"
add-apt-repository "deb http://ponylang.org/releases/apt ponyc-numa main"

apt-get update

apt-get install ponyc

