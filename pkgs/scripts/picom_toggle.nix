{ pkgs, ... }:
pkgs.writeShellScriptBin "picom_toggle" ''
  if pgrep -x "picom" > /dev/null
  then
    killall picom
  else
    picom -b --config ~/.config/awesome/picom.conf
  fi

''
