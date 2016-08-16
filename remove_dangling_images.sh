#!/bin/bash

# remove dangling images (a.k.a <none> images)
docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi


