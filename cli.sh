#!/usr/bin/env bash

set -e

export DOTMANAGER_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."

source "$DOTMANAGER_DIR/init.sh"

function run_command {
  local name=$1

  export MAIN_COMMAND=$name

  "$COMMAND_DIR/$name.sh" ${@:2}
}

main_command=$1

case "$main_command" in
  install)
    run_command install "${@:2}"
    ;;

  *)
    echo "You must specific one of the following commands:"
    echo
    echo "  install"
    exit 1
esac
