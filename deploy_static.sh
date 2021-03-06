#!/bin/bash

set -e
DATE=`date +%Y-%m-%d`
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

WEB_URL=http://example.com
CONTAINER_NAME=local-ghost
DOMAIN=http://localhost:2368

# Local editor is needed to extract the static website
docker rm -f $CONTAINER_NAME || true
$DIR/launch_local_editor.sh

echo "Waiting for ghost to finish initialization..."
# We can end up with a page "Site is starting up, please wait a moment then retry." with the CI if we don't do that
sleep 10

docker exec $CONTAINER_NAME gssg --domain ${DOMAIN} --url ${WEB_URL}
