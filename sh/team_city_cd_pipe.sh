#!/bin/bash
set -ex

# This script (along with .env) are SCP'd onto
# the deployment VM into a unique folder/

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

# Get the new image
docker pull ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}

# Bring down the current container
docker rm --force ${FACES_BOOK_CONTAINER} &> /dev/null || true

# Bring up the new container
docker run \
  --detach \
  --name ${FACES_BOOK_CONTAINER} \
  --publish ${FACES_BOOK_PORT}:${FACES_BOOK_PORT} \
  --env FACES_BOOK_PORT=${FACES_BOOK_PORT} \
    ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}

# Crude readyness wait
sleep 2

docker logs ${FACES_BOOK_CONTAINER}
