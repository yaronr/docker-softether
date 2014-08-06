# SoftEther VPN server

FROM ubuntu:latest
MAINTAINER Frank Rosquin <frank.rosquin@gmail.com>

RUN apt-get update &&\
        apt-get -y -q install gcc make wget

ENV VERSION v4.10-9473-beta-2014.07.12

RUN wget http://www.softether-download.com/files/softether/${VERSION}-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-${VERSION}-linux-x64-64bit.tar.gz -O /tmp/softether-vpnserver.tar.gz &&\
        tar -xzvf /tmp/softether-vpnserver.tar.gz -C /usr/local/ &&\
        rm /tmp/softether-vpnserver.tar.gz

WORKDIR /usr/local/vpnserver
RUN make i_read_and_agree_the_license_agreement
RUN apt-get purge -y -q --auto-remove gcc make wget

ADD runner.sh /usr/local/vpnserver/runner.sh
RUN chmod 755 /usr/local/vpnserver/runner.sh

#RUN mkdir -p /var/log/vpnserver/security_log &&\
#        mkdir /var/log/vpnserver/packet_log &&\
#        mkdir /var/log/vpnserver/server_log &&\
#        ln -s /var/log/vpnserver/*_log /usr/local/vpnserver/


EXPOSE 443/tcp 992/tcp 1194/tcp 1194/udp 5555/tcp

# ENTRYPOINT ["/usr/local/vpnserver/vpnserver", "execsvc"]
ENTRYPOINT ["/usr/local/vpnserver/runner.sh"]
