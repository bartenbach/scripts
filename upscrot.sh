#!/bin/bash
#  upscrot - screenshot, upload, copy url to clipboard in one fell swoop :)
#  author: blake bartenbach
#

img_name=$RANDOM
green="\e[0;32m"
red="\e[031m"
reset="\e[0m"
save_image=0

function main {

  if [[ "$1" == "-s" ]] || [[ "$1" -eq "--save" ]];then
    save_image=1
  fi

  scrot -s "$img_name".png &> /dev/null
  imgur "$img_name".png 

  if [[ $? -eq 0 ]]; then
    echo -e "${green}[URL copied]$reset"
    if [[ $save_image != 1 ]];then
      rm "$img_name".png
    fi
    exit 0
  else
    echo -e "${red}[Upload failed]$reset"
    exit 1
  fi

}

main "$@"

# vim: set ft=sh:
