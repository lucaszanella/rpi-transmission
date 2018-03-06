Transmission Daemon
===================

Very light **transmission-daemon** installation based on the Hypriot image for
the Raspberry Pi.

By design, it will only run the **transission** daemon, exposing its standard
port and exporting volumes for both the *configuration* and the *data*
(including download) directories.

# Build

```
sudo docker build -t rpi-transmission .
```

# Run

```
docker run -d \
  -p  9091:9091 \
  -p  51413:51413 \
  -p  51413:51413/udp \
  --restart unless-stopped \
  -v /media/external:/downloads \
  -v /home/transmission-watch:/home/transmission-watch \
  rpi-transmission
```

In my case, `/media/external` represents an external drive mounted on the docker
host, and `/root/transmission-daemon` contains all the settings and in-progress
torrents for the container.

The use of `restart='always'` ensures the container starts with the docker host.
