#!/usr/bin/env bash

set -e

function add_path {
  local path=$1
  local config_dir=$(module_installation_dir)

  export PATH=$path:$PATH

  mkdir -p "$config_dir"
  echo "$path" >>"$config_dir/path"
}
export -f add_path

function add_profile {
  local content=$1
  local config_dir=$(module_installation_dir)

  eval "$content"

  mkdir -p "$config_dir"

  echo "$content" >>"$config_dir/profile"
}
export -f add_profile

function compile_path {
  local find_path="$(installed_modules_dir)/*/path"

  if ! ls $find_path 1>/dev/null 2>&1; then
    return
  fi

  cat $find_path | paste -s -d":"
}
export -f compile_path

function compile_profile {
  echo "#!/usr/bin/env bash"
  echo

  local path=$(compile_path)

  if [ ! -z "$path" ]; then
    echo "export PATH=$(compile_path):\$PATH"
    echo
  fi

  local find_path="$(installed_modules_dir)/*/profile"

  if ! ls $find_path 1>/dev/null 2>&1; then
    return
  fi

  cat $find_path
}
export -f compile_profile
