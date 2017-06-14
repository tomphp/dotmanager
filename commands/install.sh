#!/usr/bin/env bash

set -e

source "$DOTMANAGER_DIR/init.sh"

sub_command=$1

case "$sub_command" in
  module)
    run_sub_command $sub_command "${@:2}"
    ;;

  *)
    echo "You must specify one of the following sub-commands to install:"
    echo
    echo "  module"
    exit 2
esac
