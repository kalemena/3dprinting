FROM ubuntu:18.04

RUN apt-get -y update; \
    apt-get -y install \
        language-pack-en \
        software-properties-common \
        cura;

ENV LANG="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"

CMD /usr/bin/cura