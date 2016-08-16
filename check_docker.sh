#!/bin/sh

# check docker info & network after installing docker
# god I'm so lazy

docker info && ifconfig docker0
