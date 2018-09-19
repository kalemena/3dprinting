# 3dprinting

[![Build Status](https://travis-ci.org/kalemena/3dprinting.svg?branch=master)](https://travis-ci.org/kalemena/cura)
[![Docker Version](https://images.microbadger.com/badges/version/kalemena/cura.svg)](https://microbadger.com/images/kalemena/cura)
[![Docker Hub](https://images.microbadger.com/badges/image/kalemena/cura.svg)](https://hub.docker.com/r/kalemena/cura/tags)

Tooling &amp; Tips for 3d printing

## Printer model

Below is used together with Creality Ender-3 model.

Ender-3 is easy to mount, with ~1h effort.

There are no specific configuration after, because Cura can use "CR-10" defaults, with only changing printer XYZ size.

## Software

### Cura

Cura engine is probably best tool for slicing.

To run CuraEngine:

```bash
$ sudo apt-get install cura
$ sudo cura &
```

Using docker:

```bash
#!/bin/sh
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
sudo docker run -ti \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -v $HOME:$HOME \
    -v $XSOCK:$XSOCK \
    -v $XAUTH:$XAUTH \
    -e XAUTHORITY=$XAUTH \
    -e DISPLAY \
    --user $UID:$GROUPS \
    kalemena/cura
```

### Repetier

Repetier Host is nice, includes Cura (although it looks using Cura directly gives better results).

### OctoPrint

Find link here:
https://github.com/OctoPrint/docker
https://hub.docker.com/r/rbartl/docker-octoprint/

## Model

Best place to find model is Thingiverse.