Transmission Daemon
===================

Very light **transmission-daemon** installation based on the Hypriot image for
the Raspberry Pi.

By design, it will only run the **transission** daemon, exposing its standard
port and exporting volumes for both the *configuration* and the *data*
(including download) directories.

You can execute it with something like:

```
docker run -d \
  -p  9091:9091 \
  -p  51413:51413 \
  -p  51413:51413/udp \
  --restart='always' \
  -v /media/external/torrent/downloading:/var/lib/transmission-daemon/downloads \
  -v /root/transmission-daemon:/etc/transmission-daemon \
  --name transmission robsharp/rpi-transmission \
```

In my case, `/media/external` represents an external drive mounted on the docker
host, and `/root/transmission-daemon` contains all the settings and in-progress
torrents for the container.

The use of `restart='always'` ensures the container starts with the docker host.
