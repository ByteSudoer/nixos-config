{ pkgs, colorscheme, ... }:
pkgs.writeShellScriptBin "fehrandom" ''

  dir=/home/bytesudoer/nixos-config/Wallpapers/${colorscheme}

  while true;do
    feh --bg-fill --randomize "$dir"
    sleep 5m
  done


''
