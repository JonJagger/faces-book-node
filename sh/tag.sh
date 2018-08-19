#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

docker tag \
  ${FACES_BOOK_IMAGE} \
  ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}
