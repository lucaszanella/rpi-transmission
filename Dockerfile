FROM resin/rpi-raspbian

MAINTAINER Rob Sharp <qnm@fea.st>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y -q transmission-daemon

RUN sed -i "s/127.0.0.1/*.*.*.*/" /etc/transmission-daemon/settings.json \
 && sed -i '0,/{/a\ \ \ \ "watch-dir": "\/transmission-watch",' /etc/transmission-daemon/settings.json \
 && sed -i '0,/{/a\ \ \ \ "watch-dir-enabled": "true",' /etc/transmission-daemon/settings.json \
 && sed -i 's/"download-dir":.*/"download-dir": "\/downloads",/g' /etc/transmission-daemon/settings.json

VOLUME /downloads

EXPOSE 9091
EXPOSE 51413
EXPOSE 51413/udp

CMD ["/usr/bin/transmission-daemon", "-f", "-g", "/etc/transmission-daemon"]

