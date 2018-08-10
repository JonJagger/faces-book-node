#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

readonly PORT=${1:-${FACES_BOOK_PORT}}
readonly IP=$(docker-machine ip default)

${MY_DIR}/docker_pipe.sh ${PORT} ${IP}