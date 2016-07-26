# pjsip-docker

Dockerfile for building pjsip as a base for asterisk & chan_respoke. 

This Dockerfile currently builds Debian "jessie" release with pjsip 2.4.5 pre-compiled. 
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

    FROM respoke/pjsip:latest

Other tags available besides `latest` are `2`, `2.4`, `2.4.5`, `2.5`, and `2.5.5`.

## license

[MIT](https://github.com/respoke/pjsip-docker/blob/master/LICENSE)


[respoke/pjsip]: https://hub.docker.com/r/respoke/pjsip/
