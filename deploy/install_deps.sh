#!/usr/bin/env bash

sudo apt-get update && sudo apt-get install -y \
  fakeroot \
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

cd ~/downloads
echo 'aws s3 cp --recursive s3://oneconcern-pkgs . --exclude "*" --include "python-oq-libs*"'
aws s3 cp --recursive s3://oneconcern-pkgs . --exclude "*" --include "python-oq-libs*"
sudo dpkg -i python-oq-libs*
