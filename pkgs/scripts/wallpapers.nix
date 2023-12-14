{ pkgs, ... }:
pkgs.writeShellScriptBin "wallpapers" ''
  if pgrep -x "fehrandom" > /dev/null
  then
    killall fehrandom
    fehrandom
  else
    fehrandom
  fi

''
