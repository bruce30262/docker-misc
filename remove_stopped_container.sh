#!/usr/bin/env sh
# remove all Exit status container
docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm -f
