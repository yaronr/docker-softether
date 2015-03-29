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

echo "Taking a nap, to allow network to properly set up.."
sleep 10
echo "That was a good nap. Now to work..."

exec /usr/local/vpnserver/vpnserver execsvc

exit $?
