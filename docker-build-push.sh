#!/usr/bin/env bash

REGISTRY='docker.io'
IMAGE_NAME='mechanisms/otp'
SHORT_HASH=$(git rev-parse --short HEAD)
VERSION=${1}


if [ -z "$VERSION" ]; then
  echo "building $IMAGE_NAME:$SHORT_HASH"
  docker build -t $IMAGE_NAME:$SHORT_HASH .
  echo "pushing ${REGISTRY}/$IMAGE_NAME:$SHORT_HASH"
  docker push ${REGISTRY}/$IMAGE_NAME:$SHORT_HASH
else
  echo "version is '$VERSION'";
  docker build -t $IMAGE_NAME:$VERSION .
  echo "pushing ${REGISTRY}/$IMAGE_NAME:$VERSION"
  docker push --all-tags ${REGISTRY}/$IMAGE_NAME
fi



