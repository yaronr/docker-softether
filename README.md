# Docker image for SoftEther VPN

This will deploy a fully functional [SoftEther VPN](https://www.softether.org) server as a docker image.

Source available on [Git Hub](https://github.com/yaronr/docker-softether).

## Download

    docker pull yaronr/softether

## Run


Simplest version:

    docker run -d --net host --name softether yaronr/softether

With external config file:

    touch /etc/vpnserver/vpn_server.config
    docker run -d -v /etc/vpnserver/vpn_server.config:/usr/local/vpnserver/vpn_server.config --net host --name softether yaronr/softether
