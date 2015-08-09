#!/bin/sh

if [ -z "$1" ]; then
  echo "Usage: $0 <PKG>"
  exit
fi

sudo apt-get -d install $1
cp /var/cache/apt/archives/*.deb .
chmod 644 *.deb


