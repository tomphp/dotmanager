#!/usr/bin/env bash

set -e

source_lib environment.sh
source_lib config.sh
source_lib packages.sh
source_lib profile.sh

function run_install_module_dependencies {
  local module_name=$1
  local dependencies_file="${MODULE_DIR}/${module_name}/dependencies"

  if [ ! -f "$dependencies_file" ]; then
    return
  fi

  echo "Installing dependencies for $module_name"

  local dependencies=$(cat $dependencies_file)

  for module in $dependencies; do
    run_install_module "$module"
  done
}

function run_install_module {
  local name=$1

  if [ -z "$name" ]; then
    echo "You must supply the name of the module to install."
    echo "Available modules are:"
    echo
    ls "$MODULE_DIR"
    exit 3
  fi

  if module_is_installed $name; then
    echo "Module $name is already installed, skipping."
    return
  fi

  if [ -f "${MODULE_DIR}/${name}/dependencies" ]; then
    run_install_module_dependencies $name
  fi

  echo "Installing module $name"
  export CURRENT_MODULE=$name
  mkdir -p "$(module_installation_dir)"

  "${MODULE_DIR}/${name}/install"
}

function run_post_install_scripts {
  for module in $(installed_modules); do
    local script="$MODULE_DIR/$module/post_install"

    if [ -f $script ]; then
      echo "Running post install script for $module"
      "$script"
    fi
  done
}

update_package_list
run_install_module $1
run_post_install_scripts
