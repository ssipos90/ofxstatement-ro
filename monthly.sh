#!/bin/sh

set -eu

test -d "$1"

docker run \
  --rm \
  -v "$1:/data" \
  --env LC_TIME=ro_RO.UTF-8 \
  ssipos/ofxstatement-ro \
  sh -c ' \
    cat /data/commands | while read -r line; do \
      ofxstatement convert -t $line; \
    done'
