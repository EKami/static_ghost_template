#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
URL=http://localhost:2368
IMAGE_NAME=ghost_with_gssg
CONTAINER_NAME=local-ghost
STATIC_OUTPUT=${DIR}/dist

docker build -t $IMAGE_NAME $DIR

docker run -d --name ${CONTAINER_NAME} \
    -e url=${URL} -p 2368:2368 -v ${DIR}/ghost_data:/var/lib/ghost/content \
    -v ${STATIC_OUTPUT}:/var/lib/ghost/static $IMAGE_NAME

echo "Launched, now navigate to $URL/ghost"
