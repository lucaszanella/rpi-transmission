# transmission-daemon debian-based container
# VERSION               0.2
FROM debian:jessie
MAINTAINER Davide Lucchesi  "davide@lucchesi.nl"

RUN apt-get update && apt-get install -y -q transmission-daemon

RUN sed -i "s/127.0.0.1/*.*.*.*/" /etc/transmission-daemon/settings.json

VOLUME /etc/transmission-daemon
VOLUME /var/lib/transmission-daemon/downloads

EXPOSE 9091
EXPOSE 51413
EXPOSE 51413/udp

CMD ["/usr/bin/transmission-daemon", "-f", "-g", "/etc/transmission-daemon"]

