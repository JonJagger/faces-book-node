#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

echo "Build the image"
docker build \
  --build-arg REPO_URL=$(git config --get remote.origin.url) \
  --build-arg REPO_SHA=$(git rev-parse HEAD) \
  --tag ${FACES_BOOK_IMAGE} \
    ${MY_DIR}/../app


echo "Bring down the current web-server if it exists"
docker rm --force ${FACES_BOOK_CONTAINER} &> /dev/null || true

echo "Bring up the new web-server"
docker run \
  --detach \
  --name ${FACES_BOOK_CONTAINER} \
  --publish ${FACES_BOOK_PORT}:${FACES_BOOK_PORT} \
  --env FACES_BOOK_PORT=${FACES_BOOK_PORT} \
    ${FACES_BOOK_IMAGE}

echo "Crude wait for readyness"
sleep 2

echo "TODO: run some tests"
#...

echo "Tag the image"
docker tag \
  ${FACES_BOOK_IMAGE} \
  ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}

echo "Push the image to the repository"
docker push \
  ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}

echo "Bring down the web-server"
docker rm --force ${FACES_BOOK_CONTAINER} &> /dev/null || true

echo "Remove the local images"
docker rmi ${FACES_BOOK_IMAGE}
docker rmi ${DOCKER_REGISTRY_URL}/${FACES_BOOK_IMAGE}

