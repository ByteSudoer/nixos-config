{ pkgs, ... }:
pkgs.writeShellScriptBin "rofi_window" ''

#!/usr/bin/env bash

bash $HOME/.config/rofi/launchers/type-3/launcher.sh

''
