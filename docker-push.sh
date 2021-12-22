#!/usr/bin/env bash

IMAGE_NAME='mechanisms/otp2'

SHORT_HASH=$(git rev-parse --short HEAD)
VERSION=${1}
IMAGE='mechanisms/otp2'


if [ -z "$VERSION" ]; then
  echo "building $IMAGE_NAME:$SHORT_HASH"
  docker build -t $IMAGE_NAME:$SHORT_HASH .
  echo "pushing $IMAGE_NAME:$SHORT_HASH"
  docker push $IMAGE_NAME:$SHORT_HASH
else
  echo "version is '$VERSION'";
  docker build -t $IMAGE_NAME:$SHORT_HASH -t $IMAGE_NAME:$VERSION -t $IMAGE_NAME:latest .
  echo "pushing $IMAGE_NAME:$SHORT_HASH, $IMAGE_NAME:$VERSION, $IMAGE_NAME:latest"
  docker push --all-tags $IMAGE_NAME
fi



