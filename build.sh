#!/bin/sh

PROJECT=$(dirname $(readlink -f "$0"))

# Delete target folder if exists.
if [ -e target ]; then
  docker run --rm -i -v $PROJECT:/src alpine:3.6 rm -rf /src/target
fi

# Generate Asciidoctor pages.
docker run --rm -it -v $PROJECT:/documents -v $PROJECT/target/site:/target difi/asciidoctor
