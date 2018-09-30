# 3dprinting

[![Build Status](https://travis-ci.org/kalemena/3dprinting.svg?branch=master)](https://travis-ci.org/kalemena/cura)
[![Docker Version](https://images.microbadger.com/badges/version/kalemena/cura.svg)](https://microbadger.com/images/kalemena/cura)
[![Docker Hub](https://images.microbadger.com/badges/image/kalemena/cura.svg)](https://hub.docker.com/r/kalemena/cura/tags)

Tooling &amp; Tips for 3d printing

## Printer model

Below is used together with Creality Ender-3 model.

Ender-3 is easy to mount, with ~1h effort.

There are no specific configuration after, because Cura can use "CR-10" defaults, with only changing printer XYZ size.

### Enhancement

* Motors

https://letsprint3d.net/2018/07/07/how-to-install-stepper-motor-dampers-ender-3/

* Head

https://www.amazon.fr/dp/B06ZYG3K2Z/ref=psdc_2908498031_t1_B01MV40Z0L?th=1

* Head Fan

www.thingiverse.com/thing:2759439
https://www.thingiverse.com/thing:2879538
https://www.thingiverse.com/thing:3092044

* Fan

https://www.amazon.fr/gp/product/B0119SLG18/ref=as_li_ss_tl?smid=A1X6FK5RDHNB96&psc=1&linkCode=sl1&tag=wish052-21&linkId=498c18dfc84c318d4be02d8940303ac7



## Software

### OpenSCAD

```bash
$ sudo add-apt-repository ppa:openscad/releases
$ sudo apt-get install openscad
```

### Cura

Cura engine is probably best tool for slicing.

https://download.ultimaker.com/current/Cura-3.4.1.AppImage

https://download.ultimaker.com/current

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

Find few of my models under [sub-folder models](models)


