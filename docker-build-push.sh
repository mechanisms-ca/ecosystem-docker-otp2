#!/usr/bin/env bash

REGISTRY='docker.io'
IMAGE_NAME='mechanisms/otp2'
SHORT_HASH=$(git rev-parse --short HEAD)
VERSION=${1}


if [ -z "$VERSION" ]; then
  echo "building $IMAGE_NAME:$SHORT_HASH"
  docker build -t $IMAGE_NAME:$SHORT_HASH .
  echo "pushing ${REGISTRY}/$IMAGE_NAME:$SHORT_HASH"
  docker push ${REGISTRY}/$IMAGE_NAME:$SHORT_HASH
else
  echo "version is '$VERSION'";
  docker build -t $IMAGE_NAME:$SHORT_HASH -t $IMAGE_NAME:$VERSION -t $IMAGE_NAME:latest .
  echo "pushing ${REGISTRY}/$IMAGE_NAME:$SHORT_HASH, ${REGISTRY}/$IMAGE_NAME:$VERSION, ${REGISTRY}/$IMAGE_NAME:latest"
  docker push --all-tags ${REGISTRY}/$IMAGE_NAME
fi



