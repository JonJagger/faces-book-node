#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
readonly IP=$(docker-machine ip default)

${MY_DIR}/docker_pipe.sh ${IP}