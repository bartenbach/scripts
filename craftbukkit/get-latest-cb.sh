#!/bin/bash

DEVELOPMENT_BUILD='http://dl.bukkit.org/latest-dev/craftbukkit.jar'
RECOMMENDED_BUILD='http://dl.bukkit.org/latest-rb/craftbukkit.jar'
BUILD=""
BUILDNAME=""

function main() {
  get_build "$@"
  download_build
}

function get_build() {
  if [[ $1 == "dev" ]];then
    BUILD=$DEVELOPMENT_BUILD
    BUILDNAME="latest-dev.jar"
  elif [[ $1 == "rb" ]];then
    BUILD=$RECOMMENDED_BUILD
    BUILDNAME="latest-rb.jar"
  elif [[ -z $1 ]] || [[ $1 == "--help" ]];then
    show_help
  else 
    echo "Unrecognized build: $1"
    exit 1
  fi
}

function download_build() {
  wget $BUILD -O $BUILDNAME
  if [[ $? -eq 0 ]];then
    echo "Download successful"
  else
    echo "Unable to download build"
  fi
}

function show_help() {
  echo "Please provide one of the following options:"
  echo "    dev - download the latest development build"
  echo "    rb  - download the latest recommended build"
  exit 1
}

main "$@"
