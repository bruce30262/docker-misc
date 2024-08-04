#!/bin/bash

# Install docker-ce and docker compose in Ubuntu/Debian Linux

set -ex

. /etc/os-release

CUR_OS=

case $ID in
    ubuntu) echo "OS: Ubuntu"
        ;;
    debian) echo "OS: Debian"
        ;;
    *) 
        echo "Unsupported OS: $ID"
        exit 1
        ;;
esac

# Update and install dependencies
sudo apt-get -y update
sudo apt-get -y install ca-certificates curl
# add key to keyrings
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/$ID/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/$ID \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install docker-ce and docker compose
sudo apt-get install -y docker-ce docker-compose-plugin

# Add user to docker group
sudo usermod -aG docker $USER

# Check docker status
sudo service docker status

echo "[!] Logout and login to use docker without sudo."
