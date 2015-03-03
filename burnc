#!/bin/bash
# burnc
# author: blake bartenbach
#   cd burning script
#
version='0.0.2'

main() {
  if [[ "$1" == "-c" ]]; then
    convert
  elif [[ "$1" == "-b" ]]; then
    if [[ "$2" == "wav" ]]; then
      burn wav
    elif [[ "$2" == "mp3" ]]; then
      burn mp3
    else
      echo "invalid format specified"
      print_help
    fi
  elif [[ "$1" == "--version" ]]; then
    echo burnc version $version
  elif [[ "$1" == "-?" ]] || [[ "$1" == "-h" ]] || [[ -z "$1" ]]; then
    print_help
  fi
}

function convert {
  for i in *.mp3 ; do
    lame --decode "$i" "$(basename "$i" .mp3)".wav
  done
}

# $1 - format to burn [wav/mp3]
burn() {
  if [[ "$?" == 0 ]]; then
    wodim -v -pad speed=0 dev=/dev/sr0 -dao -swab -eject *.$1
  fi
}

function print_help {
  echo "burnc $version by blake bartenbach"
  echo "  -c              convert files mp3 files in cwd to wav"
  echo "  -b [wav|mp3]    burns specified files in cwd to disc"
  echo "  -h/-?           shows this help menu"
}  


main "$@"
# vim: set ft=sh:
