#
# cobpile
# author: blake bartenbach
# purpose: ease of command line compiling and running cobol programs
#
version="0.0.1"
red="\e[0;31m"
green="\e[032m"
reset="\e[0m"
NO_SOURCE_FILE=5
COMPILATION_FAILED=7

main() {
  if [[ "$1" == "-x" ]] || [[ "$1" == "--execute" ]]; then
    compile
    run
  elif [[ "$1" == "-c" ]] || [[ "$1" == "--compile" ]]; then
    compile
  elif [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]] || [[ -z "$1" ]]; then
    showhelp
  elif [[ "$1" == "-v" ]] || [[ "$1" == "--version" ]];then
    showversion
  else
    echo "unrecognized option: $1  (see cobpile --help)"
  fi
}

function showversion {
  echo "cobpile v$version"
}

function compile {
  if [[ -z $2 ]]; then
    echo "error: no source file provided"
    exit $NO_SOURCE_FILE
  fi
  cobc -x $2 -o program -O
  if [[ $? -eq 0 ]]; then
    echo -e "${green}COMPILATION SUCCESSFUL$reset"
  else
    echo -e "${red}COMPILATION FAILED$reset"
    exit $COMPILATION_FAILED
  fi
}

function run {
  ./program
  exit 0
}

function showhelp {
  echo "cobpile v$version by blake bartenbach"
  echo "  -c | --compile [source.cob]   compile cobol source code"
  echo "  -x | --execute [source.cob]   compile and run cobol source code"
  echo "  -h | --help                   show this menu"
  echo "  -v | --version                print the version of this program"
}

main "$@"
# vim: set filetype=sh:
