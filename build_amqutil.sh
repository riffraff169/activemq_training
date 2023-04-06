#!/bin/bash

cd amqutil
docker run -it --rm --name amqutil -v "$(pwd)":/usr/src/maven -w /usr/src/maven maven mvn compile assembly:single

