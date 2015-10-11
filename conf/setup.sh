#!/bin/sh

cp id_rsa.pub id_rsa ~/.ssh/
cp id_rsa.pub ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

cp bash_profile $HOME/.bash_profile

