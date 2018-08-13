#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/.env

readonly IP=${1:-localhost}
readonly CURL_LOG="/tmp/faces-book-curl.log"

# - - - - - - - - - - - - - - - - - - - - - - - - - - -

curl_route()
{
  route=$1
  echo "cURLing... http://${IP}:${FACES_BOOK_PORT}${route}"
  curl -i -f -X GET "http://${IP}:${FACES_BOOK_PORT}${route}" &> ${CURL_LOG}
  status=$?
  if [ "${status}" -eq "0" ]; then
    echo "PASS ${status} ${route}"
  else
    echo "FAIL ${status} ${route}"
    cat ${CURL_LOG}
    ${MY_DIR}/logs.sh
  fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - -

echo "faces-book: Running unit tests..."
curl_route "/test"
curl_route "/sha"

echo "faces-book: Checking routes are 200..."
curl_route "/"
curl_route "/index"
curl_route "/years"
curl_route "/faces?year=2017"
curl_route "/faces?year=2018"
curl_route "/shuffle?year=2017" && grep -q Shravan ${CURL_LOG}
curl_route "/shuffle?year=2018" && grep -q Varsha  ${CURL_LOG}
