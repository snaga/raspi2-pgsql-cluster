#!/bin/sh

ROOT=`dirname $0`
cd $ROOT
HOSTNAME=`hostname`

PATH=$ROOT:$PATH
export PATH

stop.sh
rm -rf $HOME/pgdata
initdb --no-locale -D $HOME/pgdata -k -E utf-8

cp -v postgresql.conf-${HOSTNAME} $HOME/pgdata/postgresql.conf
cp -v pg_hba.conf-${HOSTNAME} $HOME/pgdata/pg_hba.conf

start.sh

