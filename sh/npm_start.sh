#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

cd ${MY_DIR}/../app
npm start