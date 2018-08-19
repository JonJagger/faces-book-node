#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

docker push \
  ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}
