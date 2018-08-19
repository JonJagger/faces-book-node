#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
source ${MY_DIR}/env-vars.sh

readonly IP=${1:-localhost}
readonly CURL_LOG="/tmp/faces-book-curl.log"

# - - - - - - - - - - - - - - - - - - - - - - - - - - -

curl_route()
{
  local route=$1
  local url="http://${IP}:${FACES_BOOK_PORT}${route}"
  if curl --fail -X GET "${url}" &> ${CURL_LOG}; then
    echo "PASS ${url}"
  else
    echo "FAIL ${url}"
    cat ${CURL_LOG}
    ${MY_DIR}/logs.sh
    exit 22
  fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - -

echo "faces-book: Running unit tests..."
curl_route "/test"
curl_route "/identity"

echo "faces-book: Checking routes are 200..."
curl_route "/"
curl_route "/index"
curl_route "/years"
curl_route "/faces?year=2017"
curl_route "/faces?year=2018"
curl_route "/shuffle?year=2017" && grep -q Shravan ${CURL_LOG}
curl_route "/shuffle?year=2018" && grep -q Varsha  ${CURL_LOG}
