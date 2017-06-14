#!/usr/bin/env bash

set -e

function update_package_list {
  echo "Updating apt"
  package_manager_update
}
export -f update_package_list

function install_package {
  local name=$1

  echo "Installing package $name"
  package_manager_install "$name"
}
export -f install_package
