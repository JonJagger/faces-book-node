#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

docker push \
  ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}
