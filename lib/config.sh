#!/usr/bin/env bash

set -e

function install_config {
  local name=$1

  echo "Installing config $name for $CURRENT_MODULE"

  local src="$(module_config_source_dir)/$name"
  local dest=$(module_installation_dir)

  cp -f "$src" "$dest"
}
export -f install_config

function link_config_to_dotfile {
  local name=$1

  echo "Installing dotfile .$name"

  ln -sf "$(module_config_source_dir)/$name" "$HOME/.$name"
}
export -f link_config_to_dotfile
