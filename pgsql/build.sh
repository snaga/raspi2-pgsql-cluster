#!/bin/sh

VERSION=9.4.5
MAJOR=`echo $VERSION | perl -e 's/^(\d+\.\d+)\..*/\1/' -p`

# Build
if [ ! -d postgresql-$VERSION ]; then
  tar zxvf postgresql-$VERSION.tar.gz
fi

cd postgresql-$VERSION
./configure --prefix=/usr/pgsql-$MAJOR
make -j 4
#make check

# Install
rm -rf /usr/pgsql-$MAJOR

sudo make install

cd contrib
make -j 4
sudo make install

tar zcvf pgsql-$MAJOR.tar.gz /usr/pgsql-$MAJOR

