#!/bin/sh

if [ ! -d postgresql-9.4.4 ]; then
  tar zxvf postgresql-9.4.4.tar.gz
fi

cd postgresql-9.4.4
./configure --prefix=/usr/pgsql-9.4
make -j 4
#make check
sudo make install

cd contrib
make -j 4
sudo make install


