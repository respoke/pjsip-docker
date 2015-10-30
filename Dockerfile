# -*- Dockerfile -*-

FROM debian:jessie
MAINTAINER David M. Lee, II <dlee@respoke.io>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
            build-essential \
            ca-certificates \
            curl \
            libgsm1-dev \
            libspeex-dev \
            libspeexdsp-dev \
            libsrtp0-dev \
            libssl-dev \
            portaudio19-dev \
            && \
    apt-get purge -y --auto-remove && rm -rf /var/lib/apt/lists/*

COPY config_site.h /tmp/

ENV PJSIP_VERSION=2.4.5
RUN mkdir /usr/src/pjsip && \
    cd /usr/src/pjsip && \
    curl -vsL http://www.pjsip.org/release/${PJSIP_VERSION}/pjproject-${PJSIP_VERSION}.tar.bz2 | \
         tar --strip-components 1 -xj && \
    mv /tmp/config_site.h pjlib/include/pj/ && \
    CFLAGS="-O2 -DNDEBUG" \
    ./configure --enable-shared \
                --disable-opencore-amr \
                --disable-resample \
                --disable-sound \
                --disable-video \
                --with-external-gsm \
                --with-external-pa \
                --with-external-speex \
                --with-external-srtp \
                --prefix=/usr \
                && \
    make all install && \
    /sbin/ldconfig && \
    rm -rf /usr/src/pjsip
