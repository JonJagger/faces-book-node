#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

# - - - - - - - - - - - - - - - - - - - - - - - - - - -

wait_till_up() # $1==container_name
{
  local n=10
  while [ $(( n -= 1 )) -ge 0 ]
  do
    if docker ps --filter status=running --format '{{.Names}}' | grep -q ^${1}$ ; then
      echo "Up on port ${PORT}"
      return
    else
      sleep 0.2
    fi
  done
  echo "${1} not up after 2 seconds"
  docker logs "${1}"
  exit 1
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - -

docker run \
  --detach \
  --name ${FACES_BOOK_CONTAINER} \
  --publish ${FACES_BOOK_PORT}:${FACES_BOOK_PORT} \
  --env SHA=$(git rev-parse HEAD) \
  --env FACES_BOOK_PORT=${FACES_BOOK_PORT} \
    ${FACES_BOOK_IMAGE} \
      sh -c "npm start"

# This is the container up...
wait_till_up ${FACES_BOOK_CONTAINER}
# But it might be ready yet. So crude wait is good enough for now...
sleep 2
