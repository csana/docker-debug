FROM alpine
MAINTAINER Norbert Csanadi <csana@csana.hu>

RUN apk update \
 && apk add tzdata \
 && rm -f /etc/localtime \
 && ln -s /usr/share/zoneinfo/Europe/Budapest /etc/localtime \
 && echo "Europe/Budapest" > /etc/timezone \
 && apk add strace iproute2 tcpdump tcpflow ngrep mtr socat htop libbz2 perl \
 && apk add swaks --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted \
 && rm -rf /var/cache/apk/*

WORKDIR /
