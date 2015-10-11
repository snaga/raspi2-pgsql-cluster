#!/bin/sh

initdb -D $HOME/pgdata --no-locale -k -E utf-8

cp pi01/*.conf $HOME/pgdata

pg_ctl -D $HOME/pgdata start

