#!/usr/bin/env bash

IMAGE_NAME='mechanisms/otp2'

SHORT_HASH=$(git rev-parse --short HEAD)
VERSION=${1}
IMAGE='mechanisms/otp2'


if [ -z "$VERSION" ]; then
  echo "building $IMAGE_NAME:$SHORT_HASH"
  docker build -t $IMAGE_NAME:$SHORT_HASH .
else
  echo "version is '$VERSION'";
  docker build -t $IMAGE_NAME:$SHORT_HASH -t $IMAGE_NAME:$VERSION -t $IMAGE_NAME:latest .
fi

echo "pushing $IMAGE_NAME"
docker push $IMAGE_NAME


