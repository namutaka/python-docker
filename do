#!/bin/bash
# do
# :vim:ft=sh:

set -e

export CURRENT_DIR=$(pwd)
export SCRIPT_DIR=$(cd $(dirname $0);pwd)

source ${CURRENT_DIR}/env.inc

mode="$1"
shift
case $mode in
  up)
    docker-compose up -d ws
    ;;
  down)
    docker-compose down
    ;;
  py)
    docker-compose exec ws sh -xc "python $@"
    ;;
  pyd)
    docker-compose exec ws sh -xc "python -i $@"
    ;;
  sh)
    docker-compose exec ws bash --init-file "./bashrc" -i
    ;;

esac

