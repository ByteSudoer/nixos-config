{ pkgs, ... }:
pkgs.writeShellScriptBin "fehrandom" ''

  dir='/home/bytesudoer/nixos-config/Wallpapers'

  while true;do
    feh --bg-scale --randomize "$dir"
    sleep 5m
  done


''
