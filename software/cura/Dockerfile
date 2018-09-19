FROM ubuntu:18.04

MAINTAINER Kalemena

ARG VERSION=1.0

 # Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Kalemena Cura" \
      org.label-schema.description="Kalemena Cura" \
      org.label-schema.url="private" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/kalemena/cura" \
      org.label-schema.vendor="Kalemena" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

RUN apt-get -y update; \
    apt-get -y install \
        language-pack-en \
        software-properties-common \
        cura;

ENV LANG="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"

CMD /usr/bin/cura