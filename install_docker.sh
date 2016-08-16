#!/bin/sh

# install docker engine & add user to group 'docker'

sudo apt-get -y update &&\

# install docker-engine from script
curl -sSL https://get.docker.com/ | sudo sh &&\

# add user to group 'docker'
#sudo groupadd docker
echo "add user to group 'docker'..."
sudo usermod -aG docker $USER &&\
echo "done"

# check if docker is successfully installed
echo "checking docker..."
docker version
