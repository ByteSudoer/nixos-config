#!/usr/bin/env bash
#
#
set -euo pipefail

dir="$HOME/nixos-config/templates"
destination=${2:-$PWD}
lang=${1:-}

supported_projects=(
  "Arion"
  "C"
  "Go"
  "init"
  "Java"
  "Latex"
  "Nix"
  "Node.js"
  "PHP/symfony"
  "Python"
  "Rust"
)

if [ "$(id -u)" -eq 0 ]; then
  echo "ERROR! $(basename "$0") should be run as a regular user"
  exit 1
fi

init_envrc_file() {
  echo "use flake" >"$PWD"/.envrc
}
usage() {
  echo "This Script creates a nix shell depending on your project."
  echo "The supported projects are : ${supported_projects[*]} ."
  echo "Usage templteInit <language> <path>"
}

case $lang in
Rust)
  echo "Rust lang"
  cp "$dir"/Rust/flake.nix "$destination"
  init_envrc_file
  ;;
C)
  echo "C/C++ env"
  cp "$dir"/C/flake.nix "$destination"
  init_envrc_file
  ;;
Python)
  echo "Python env"
  cp "$dir"/Python/flake.nix "$destination"
  init_envrc_file
  ;;
Java)
  echo "Java env"
  cp "$dir"/Java/flake.nix "$destination"
  init_envrc_file
  ;;
Php)
  echo "PHP symfony env"
  cp "$dir"/PHP/flake.nix "$destination"
  init_envrc_file
  ;;
Arion)
  cp "$dir"/Arion/arion-pkgs.nix "$destination"
  cp "$dir"/Arion/arion-compose.nix "$destination"
  ;;
Node.js)
  echo "Node.js env"
  cp "$dir"/Node.js/flake.nix "$destination"
  init_envrc_file
  ;;
init)
  echo "Devops env"
  cp "$dir"/init/flake.nix "$destination"
  init_envrc_file
  ;;
Nix)
  echo "Nix env"
  cp "$dir"/Nix/flake.nix "$destination"
  init_envrc_file
  ;;
Go)
  echo "Go env"
  cp "$dir"/init/flake.nix "$destination"
  init_envrc_file
  ;;
Latex)
  echo "Latex Env"
  cp "$dir/Tex/flake.nix" $destination
  init_envrc_file
  ;;
*)
  usage
  ;;
esac
