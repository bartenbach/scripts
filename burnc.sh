#!/bin/bash
# burnc
# author: blake bartenbach
#   converts all mp3 files to wav in the cwd
#
version='0.0.1'

main() {
  if [[ "$1" == "-c" ]]; then
    convert
  elif [[ "$1" == "-b" ]]; then
    burn
  elif [[ "$1" == "-?" ]] || [[ "$1" == "-h" ]] || [[ -z "$1" ]]; then
    print_help
  fi
}

function convert {
  for i in *.mp3 ; do
    lame --decode "$i" "$(basename "$i" .mp3)".wav
  done
}

function burn {
  if [[ "$?" == 0 ]]; then
    wodim -v -pad speed=0 dev=/dev/sr0 -dao -swab -eject *.wav
  fi
}

function print_help {
  echo "burnc $version by blake bartenbach"
  echo "  -c     convert files mp3 files in cwd to wav"
  echo "  -b     burns wav files in cwd to disc"
  echo "  -h/-?  shows this help menu"
}  


main "$@"
# vim: set ft=sh:
