#!/bin/sh

echo 1 > /proc/sys/net/ipv4/ip_forward
cp sysctl.conf /etc

iptables -F
iptables -A FORWARD -i eth0:1 -o eth0 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

iptables-save > /etc/iptables
ls -l /etc/iptables
cat /etc/iptables

cat <<EOF > /etc/network/if-pre-up.d/iptables
#!/bin/sh

iptables-restore < /etc/iptables
EOF

chown root:root /etc/network/if-pre-up.d/iptables
chmod 755 /etc/network/if-pre-up.d/iptables

ls -l /etc/network/if-pre-up.d/iptables
cat /etc/network/if-pre-up.d/iptables
