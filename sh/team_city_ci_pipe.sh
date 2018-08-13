#!/bin/bash
set -ex

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

${MY_DIR}/build.sh
${MY_DIR}/down.sh
${MY_DIR}/up.sh
${MY_DIR}/run_curl_tests.sh
${MY_DIR}/tag.sh
${MY_DIR}/push.sh
${MY_DIR}/cleanup.sh
