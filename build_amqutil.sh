#!/bin/bash

git submodule init
git submodule update

if [ "$1" == "build" ]; then
    # shellcheck disable=SC2164
    cd amqutil
    docker run -it --rm --name amqutil -v "$(pwd)":/usr/src/maven -w /usr/src/maven maven mvn compile assembly:single
fi

