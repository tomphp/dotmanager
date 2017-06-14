#!/usr/bin/env bash

set -e

export LIB_DIR=$DOTMANAGER_DIR/lib
export INSTALL_DIR=$HOME/.dotmanager
export MODULE_DIR=$DOTMANAGER_DIR/modules
export CONFIG_DIR=$DOTMANAGER_DIR/configs
export COMMAND_DIR=$DOTMANAGER_DIR/commands
export DRIVERS_DIR=$DOTMANAGER_DIR/drivers

function source_lib {
  source "${LIB_DIR}/${1}"
}
export -f source_lib

function run_sub_command {
  "$COMMAND_DIR/$MAIN_COMMAND/$sub_command.sh" "${@:2}"
}
export -f run_sub_command

source "$DRIVERS_DIR/ubuntu_root.sh"
