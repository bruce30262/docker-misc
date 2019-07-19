#!/bin/sh

# Install docker-ce in Ubuntu Linux

set -ex

# Update
sudo apt-get -y update
# Allow apt to use a repository over HTTPS
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Set up the stable repository.
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

# Install docker-ce
sudo apt-get install docker-ce 

# Check docker status
sudo service docker status
