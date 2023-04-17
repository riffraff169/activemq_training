#!/bin/bash

DIR=AmqJavaExample
VER=0.0.1-SNAPSHOT
CLASS=com.openlogic.activemq.ConsumerRunner
JAR=${DIR}-${VER}.jar
java -cp "./${DIR}/target/${JAR}" "${CLASS}"

