#!/bin/bash

if [[ -f latest-dev.jar ]];then
  jar="latest-dev.jar"
elif [[-f latest-rb.jar ]];then
  jar="latest-rb.jar"
else
  echo "No recognized jar found"
  exit 1
fi

java -server -Xms4096M -Xmx8192M -jar $jar
