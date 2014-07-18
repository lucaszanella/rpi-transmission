docker.transmission
===================

Very light **transmission-daemon** installation fully based on the Debian packages.

By design, it will only run the **transission** daemon, exposing its standard port and exporting volumes for both the *configuration* and the *data* (including download) directories.

You can execute it with something like:

    docker run -d -P --name transmission odiobill/transmission

Be aware that the default configuration allows connection by any IP address and with the default username/password pair, both set to *transmission*.
To change this, you may want to run another (temporary) container that imports its volumes. Run it with:

    docker run -i -t --name config_transmission --volumes-from transmission odiobill/transmission bash

