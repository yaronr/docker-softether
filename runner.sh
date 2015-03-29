#!/bin/sh

if [ ! -d "/var/log/vpnserver/security_log" ]; then
  mkdir -p /var/log/vpnserver/security_log
fi

if [ ! -d "/var/log/vpnserver/packet_log" ]; then
  mkdir -p /var/log/vpnserver/packet_log
fi

if [ ! -d "/var/log/vpnserver/server_log" ]; then
  mkdir -p /var/log/vpnserver/server_log
fi

ln -s /var/log/vpnserver/*_log /usr/local/vpnserver/

<<<<<<< HEAD
echo "Taking a nap, to allow network to properly set up.."
sleep 10

echo "That was a good nap. Now to work..."


=======
>>>>>>> cb86f0739d134ac446c583a821167e7fa4b19ce4
exec /usr/local/vpnserver/vpnserver execsvc

exit $?
