#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"

cd ${MY_DIR}/../app
node -e 'require("./public/js/tests/run.js")();'
