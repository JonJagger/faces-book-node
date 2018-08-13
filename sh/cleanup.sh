#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

${MY_DIR}/down.sh

docker rmi ${FACES_BOOK_IMAGE}
docker rmi ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}
