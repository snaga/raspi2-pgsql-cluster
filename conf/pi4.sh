#!/bin/sh

cp -v hosts /etc/hosts
chmod 644 /etc/hosts

cp -v hostname.pi4 /etc/hostname
chmod 644 /etc/hostname

cp -v interfaces.pi4 /etc/network/interfaces
chmod 644 /etc/network/interfaces

sh ssh.sh
