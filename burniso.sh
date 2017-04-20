#!/bin/bash
#    burniso
#       By Blake Bartenbach
#
version="0.0.1"

function show_help {
  echo "burniso v$version"
  echo "   -b,--burn  <friendly name> <directory>"
  echo "   -e,--erase                            "
}

# RECIEVES - all command line arguments
function burniso() {
  echo "Making iso from files..."
  mkisofs -V "$1" -J -r -o temp.iso "$2" &>/dev/null
  echo "Burning iso to disc..."
  cdrecord -v -multi dev=/dev/sr0 temp.iso &>/dev/null
  echo "Cleaning up..."
  rm temp.iso
  echo "Ejecting disc..."
  eject /dev/sr0
  echo "Burn success!"
}

# untested - this should work though
function eraseiso {
  cdrecord -v dev=/dev/sr0 blank=fast
}

if [[ -z "$1" ]]; then
  show_help
elif [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
  show_help
elif [[ "$1" == "-b" ]] || [[ "$1" == "--burn" ]]; then
  burniso "$@"
elif [[ "$1" == "-e" ]] || [[ "$1" == "--erase" ]]; then
  eraseiso
elif [[ "$1" == "-v" ]] || [[ "$1" == "--version" ]];then
  echo "burniso v$version"
fi


