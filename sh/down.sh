#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

docker rm --force ${FACES_BOOK_CONTAINER} &> /dev/null || true
