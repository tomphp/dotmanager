#!/usr/bin/env bash

set -e

function package_manager_install {
  apt-get install -y "$1"
}
export -f package_manager_install

function package_manager_update {
  apt-get update
}
export -f package_manager_update

function bash_profile_file {
  echo "$HOME/.bashrc"
}
export -f bash_profile_file
