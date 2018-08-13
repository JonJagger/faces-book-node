#!/bin/bash
set -e

# This will need to be SCP'd onto the deployment
# machine before being SSH executed...
# Or could it be piped into sh?

# There are many groups deploying to the same VM...
# They each need their own
# o) folder on the VM to store this script.
#    Can't ssh < script as there seems to be no option to do that
# o) their own image name. This means it must have been pushed as a unique name
# o) their own specific port.

readonly PORT=$1

docker pull dockerreg.training.local:5000/faces-book

docker rm --force faces-book &> /dev/null || true

docker run \
  --detach \
  --name faces-book \
  --publish ${PORT}:${PORT} \
  --env FACES_BOOK_PORT=${PORT} \
    dockerreg.training.local:5000/faces-book \
      sh -c "./faces-book.sh"

sleep 2
docker container ls
docker logs faces-book
