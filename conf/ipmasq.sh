#!/bin/sh

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -A FORWARD -i eth0:1 -o eth0 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
