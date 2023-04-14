#!/bin/bash

git submodule init
git submodule update

if [ "$1" == "build" ]; then
    # shellcheck disable=SC2164
    cd AmqJavaExample
    docker run -it --rm --name amqjavaex -v "$(pwd)":/usr/src/maven -w /usr/src/maven maven mvn clean install
fi

