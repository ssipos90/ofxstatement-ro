#!/bin/sh

set -eu

image=ssipos/ofxstatement-ro

tags_arg=(--tag="$image:latest")
for tag in $@; do
  tags_arg+=(--tag="${image}:${tag}")
done

docker build . "${tags_arg[@]}"
