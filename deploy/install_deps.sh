#!/usr/bin/env bash

sudo apt-get update && apt-get install -y \
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

sudo add-apt-repository -y ppa:openquake/ppa

sudo apt-get update && apt-get install -y \
  python-oq-libs-extra \
  python-oq-libs
