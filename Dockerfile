FROM alpine
MAINTAINER Norbert Csanadi <csana@csana.hu>

RUN apk update \
 && apk add tzdata \
 && rm -f /etc/localtime \
 && ln -s /usr/share/zoneinfo/Europe/Budapest /etc/localtime \
 && echo "Europe/Budapest" > /etc/timezone \
 && apk add strace iproute2 tcpdump tcpflow ngrep mtr socat htop \
 && rm -rf /var/cache/apk/*

WORKDIR /
