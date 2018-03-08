FROM resin/rpi-raspbian

MAINTAINER Rob Sharp <qnm@fea.st>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y -q transmission-daemon

RUN sed -i '0,/{/a\ \ \ \ "watch-dir": "\/home\/transmission-watch",' /etc/transmission-daemon/settings.json \
 && sed -i '0,/{/a\ \ \ \ "watch-dir-enabled": "true",' /etc/transmission-daemon/settings.json \
 && sed -i 's/"download-dir":.*/"download-dir": "\/home\/downloads",/g' /etc/transmission-daemon/settings.json

VOLUME /home/downloads
VOLUME /home/transmission-watch

EXPOSE 9091
EXPOSE 51413
EXPOSE 51413/udp

CMD ["/usr/bin/transmission-daemon", "-f", "-g", "/etc/transmission-daemon"]
