#!/usr/bin/env bash

# install docker
wget -nv -O - https://get.docker.com/ | sh

# setup dokku apt repository
wget -nv -O - https://packagecloud.io/dokku/dokku/gpgkey | apt-key add -
export SOURCE="https://packagecloud.io/dokku/dokku/ubuntu/"
export OS_ID="$(lsb_release -cs 2>/dev/null || echo "bionic")"
echo "xenial bionic focal" | grep -q "$OS_ID" || OS_ID="bionic"
echo "deb $SOURCE $OS_ID main" | sudo tee /etc/apt/sources.list.d/dokku.list

sudo apt-get update

# install dokku
sudo apt-get install dokku -y

# run with root!
sudo dokku plugin:install-dependencies --core
