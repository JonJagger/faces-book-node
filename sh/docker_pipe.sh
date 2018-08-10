#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"

# - - - - - - - - - - - - - - - - - - - - - - - - - - -

show_use()
{
  echo 'USE: docker_pipe.sh [PORT] [IP_ADDRESS]'
  echo '  PORT defaults to 80'
  echo '  IP_ADDRESS defaults to localhost'
  echo
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - -

show_use
${MY_DIR}/build.sh
${MY_DIR}/down.sh
${MY_DIR}/up.sh $*
sleep 0.5
${MY_DIR}/logs.sh
${MY_DIR}/run_curl_tests.sh $*
