#!/bin/bash

DOCKER_REGISTRY_HOST=$DOCKER_REGISTRY_HOST
BULLBOARD_VERSION=$BULLBOARD_VERSION

[[ -n $1 ]] && BULLBOARD_VERSION=$1

jq '.version="0.0.0"' package.json > package.build.json

docker buildx build \
--push \
--platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
--tag $DOCKER_REGISTRY_HOST/bullboard:$BULLBOARD_VERSION .
