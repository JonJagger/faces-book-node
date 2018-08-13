#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

docker build \
  --build-arg SHA=$(git rev-parse HEAD) \
  --tag ${FACES_BOOK_IMAGE} \
    ${MY_DIR}/../app