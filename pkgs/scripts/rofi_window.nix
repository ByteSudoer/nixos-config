{ pkgs, ... }:
pkgs.writeShellScriptBin "rofi_window" ''

#!/usr/bin/env bash
rofi \
    -show window \
    -theme $HOME/.config/rofi/launchers/type-4/style-3.rasi

''
