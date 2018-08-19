#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

docker build \
  --build-arg REPO_URL=$(git config --get remote.origin.url) \
  --build-arg REPO_SHA=$(git rev-parse HEAD) \
  --tag ${FACES_BOOK_IMAGE} \
    ${MY_DIR}/../app