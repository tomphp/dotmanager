#!/usr/bin/env bash

set -e

function installed_modules_dir {
  echo "$INSTALL_DIR/modules"
}
export -f installed_modules_dir

function module_installation_dir {
  echo "$(installed_modules_dir)/$CURRENT_MODULE"
}
export -f module_installation_dir

function module_config_source_dir {
  echo "$CONFIG_DIR/$CURRENT_MODULE"
}
export -f module_config_source_dir

function installed_modules {
  ls "$(installed_modules_dir)"
}
export -f installed_modules

function module_is_installed {
  local name=$1

  if [ -e "$(installed_modules_dir)/$name" ]; then
    return 0
  else
    return 1
  fi
}
