#!/bin/sh

psql -h pi01 -c checkpoint postgres
pg_basebackup -D $HOME/pgdata --progress --verbose -h pi01
psql -h pi01 -c checkpoint postgres


cp -v pi02/recovery.conf $HOME/pgdata
