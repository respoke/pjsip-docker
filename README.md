# DEPRECATED

Asterisk 13.8 introduced the `--with-pjproject-bundled` flag to the `./configure`
script, which greatly simplifies the process of installing pjsip and configuring it
correctly. For more details, see the article "[Asterisk 13.8.0: Now With Easier 
PJSIP Install Method!][pjsip-blog-post]".

[pjsip-blog-post]: https://blogs.asterisk.org/2016/03/16/asterisk-13-8-0-now-easier-pjsip-install-method/

---

# pjsip-docker

Dockerfile for building pjsip as a base for asterisk & chan_respoke.

This Dockerfile currently builds Debian "jessie" release with pjsip pre-compiled.
We apply a slight customization to the pjsip build to better support chan_respoke and
WebRTC in general by increasing the maximum number of ice candidates that pjsip allows.

## usage

To build this image, just clone this repo and build using docker:

    git clone https://github.com/respoke/pjsip-docker.git
    cd pjsip-docker
    docker build -t pjsip .

More often though, you'll want to use the image built by this repo as a base for your
own image that needs pjsip. This repo is linked to the Docker hub at [respoke/pjsip][],
so you can simply add this to the top of your own Dockerfile:

    FROM respoke/pjsip:2

## license

[MIT](https://github.com/respoke/pjsip-docker/blob/master/LICENSE)


[respoke/pjsip]: https://hub.docker.com/r/respoke/pjsip/
