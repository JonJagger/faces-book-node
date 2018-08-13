#!/bin/bash
set -e

# This will need the .env SCP'd onto the delopyment VM


readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

docker pull ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}

docker rm --force ${FACES_BOOK_CONTAINER} &> /dev/null || true

docker run \
  --detach \
  --name ${FACES_BOOK_CONTAINER} \
  --publish ${FACES_BOOK_PORT}:${FACES_BOOK_PORT} \
  --env FACES_BOOK_PORT=${FACES_BOOK_PORT} \
    ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE} \
      sh -c "./faces-book.sh"

sleep 2
docker container ls
docker logs faces-book
