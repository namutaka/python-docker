#!/bin/bash
# do
# :vim:ft=sh:

set -e

export CURRENT_DIR=$(pwd)
export SCRIPT_DIR=$(cd $(dirname $0);pwd)

source ${CURRENT_DIR}/env.inc

mode="$1"
shift || true

arg_str=""
for arg in "$@"; do
  arg_str="$arg_str \"$arg\""
done

case $mode in
  up)
    docker-compose up -d ws
    ;;
  down)
    docker-compose down
    ;;
  py|python)
    docker-compose exec ws sh -xc "python $arg_str"
    ;;
  sh)
    docker-compose exec ws bash --init-file "./bashrc" -i
    ;;

  *)
    echo "Usage: $0 [up|down|py|python|sh]" >&2
    exit 1
esac

