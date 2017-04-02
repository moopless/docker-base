FROM ubuntu:16.04
MAINTAINER mooplessbrew@gmail.com

ENV DEBIAN_FRONTEND="noninteractive" \
    LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    TERM="xterm"

RUN sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list && \
    apt-get -q update && \
    apt-get install -qy locales && \
    echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup &&\
    echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache && \
\
    apt-get -qy --force-yes dist-upgrade && \
    apt-get install -qy --force-yes \
        apt-transport-https \
        bzip2 \
        ca-certificates curl \
        git \
        inetutils-ping \
        openssl \
        procps psmisc python python-software-properties p7zip-full \
        rsync rsyslog \
        software-properties-common ssl-cert sudo supervisor \
        tar \
        wget \
        unrar-free unzip \
        vim-tiny \
        xz-utils && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
