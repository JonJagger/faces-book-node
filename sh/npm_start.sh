#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

readonly PORT=${1:-${FACES_BOOK_PORT}}

cd ${MY_DIR}/../app
export NODE_PORT=${PORT}
npm start