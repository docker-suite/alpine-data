# ![](https://github.com/docker-suite/artwork/raw/master/logo/png/logo_32.png) alpine-data
[![Build Status](http://jenkins.hexocube.fr/job/docker-suite/job/alpine-data/badge/icon?color=green&style=flat-square)](http://jenkins.hexocube.fr/job/docker-suite/job/alpine-data/)
![Docker Pulls](https://img.shields.io/docker/pulls/dsuite/alpine-data.svg?style=flat-square)
![Docker Stars](https://img.shields.io/docker/stars/dsuite/alpine-data.svg?style=flat-square)
![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/dsuite/alpine-data/latest.svg?style=flat-square)
![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/dsuite/alpine-data/latest.svg?style=flat-square)
[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![dockeri.co](https://dockeri.co/image/dsuite/alpine-data)](https://hub.docker.com/r/dsuite/alpine-data)


Minimal [Alpine][alpine] image used as a data container based on [docker-suite (dsuite)][docker-suite] [alpine-base][alpine-base] images.

A full list of [Packages][alpine-base-readme-packages], [Utilities][alpine-base-readme-utilities], [Environment variables][alpine-base-readme-variables] and [Volumes][alpine-base-readme-volumes] are described in the [alpine-base Readme][alpine-base-readme].


## ![](https://github.com/docker-suite/artwork/raw/master/various/pin/png/pin_16.png) Data container

This image is to be used as a data container.  
To do since the `/data` folder is declared as a volume ans is the default working directory.

[alpine]: http://alpinelinux.org/
[docker-suite]: https://github.com/docker-suite/
[alpine-base]: https://github.com/docker-suite/alpine-base/
[alpine-base-readme]: https://github.com/docker-suite/alpine-base/blob/master/Readme.md/
[alpine-base-readme-packages]: https://github.com/docker-suite/alpine-base/blob/master/Readme.md#-packages-included/
[alpine-base-readme-utilities]: https://github.com/docker-suite/alpine-base/blob/master/Readme.md#-utilities/
[alpine-base-readme-variables]: https://github.com/docker-suite/alpine-base/blob/master/Readme.md#-environment-variables/
[alpine-base-readme-volumes]: https://github.com/docker-suite/alpine-base/blob/master/Readme.md#-volumes/
