#!/bin/bash
set -ex

# This script (along with .env) must be SCP'd onto the
# deployment VM into a unique folder/

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

docker pull ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}

docker rm --force ${FACES_BOOK_CONTAINER} &> /dev/null || true

sleep 5 # wait for port to be released? What's got port 9001 ?

docker container ls -a

docker run \
  --detach \
  --name ${FACES_BOOK_CONTAINER} \
  --publish ${FACES_BOOK_PORT}:${FACES_BOOK_PORT} \
  --env FACES_BOOK_PORT=${FACES_BOOK_PORT} \
    ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE} \
      sh -c "./faces-book.sh"

sleep 2

docker logs faces-book
