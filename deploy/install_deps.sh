#!/usr/bin/env bash

apt-get update && apt-get install -y \
  python \
  python-pip \
  software-properties-common \
  debhelper \
  devscripts \
  dh-autoreconf \
  quilt \
  unzip \
  zip \
  wget

add-apt-repository -y ppa:openquake/ppa

apt-get update && apt-get install -y \
  python-oq-libs-extra \
  python-oq-libs
