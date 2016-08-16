#!/bin/bash

# get container ip 
# usage: ./get_container_ip <container>

docker inspect -f "{{ .NetworkSettings.IPAddress }}" $1
