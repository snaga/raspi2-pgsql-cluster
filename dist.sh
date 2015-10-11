#!/bin/sh

DEST="pi02 pi03 pi04"

for d in $DEST;
  do rsync -avv --delete --exclude=.git . $d:raspi2-pgsql-cluster
done;

