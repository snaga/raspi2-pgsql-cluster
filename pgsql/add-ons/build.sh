#!/bin/bash

PATH=/usr/pgsql-9.4/bin:$PATH
export PATH

# TDE for PG
git clone https://github.com/uptimejp/tdeforpg.git
pushd tdeforpg/SOURCES/data_encryption/93 
env USE_PGXS=1 make clean all
sudo env PATH=$PATH USE_PGXS=1 make install

cd ../../bin

sudo cp *.sh /usr/pgsql-9.4/bin
sudo chmod 755 /usr/pgsql-9.4/bin/*.sh

popd

# SQL Firewall
git clone https://github.com/uptimejp/sql_firewall.git
pushd sql_firewall
env USE_PGXS=1 make clean all
sudo env PATH=$PATH USE_PGXS=1 make install
popd

# pgaudit
git clone https://github.com/uptimejp/pgaudit.git
pushd pgaudit
env USE_PGXS=1 make clean all
sudo env PATH=$PATH USE_PGXS=1 make install
popd
