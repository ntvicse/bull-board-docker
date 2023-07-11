#!/bin/bash

DOCKER_REGISTRY_HOST=$DOCKER_REGISTRY_HOST
BULLBOARD_VERSION=$BULLBOARD_VERSION

[[ -n $1 ]] && BULLBOARD_VERSION=$1

jq '.version="0.0.0"' package.json > package.build.json

docker build -t $DOCKER_REGISTRY_HOST/bullboard:$BULLBOARD_VERSION .