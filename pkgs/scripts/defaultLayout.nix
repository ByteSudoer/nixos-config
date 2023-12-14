{ pkgs, ... }:
pkgs.writeShellScriptBin "defaultLayout" ''

  primary="eDP-1-1"
externel="HDMI-1-1"
if xrandr | grep -q "$externel connected"; then
 xrandr --output  "$primary" --mode 1920x1080 --pos 1920x0 --rotate normal --output "$externel" --primary --mode 1920x1080 --pos 0x0 --right-of "$primary" --rotate normal
else
 xrandr --output  "$primary" --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output "$externel" --off --output HDMI-1-1 --off
 # xrandr --output  "$primary" --primary --mode 1920x1080 --pos 0x0 --rotate normal --output "$externel" --off
fi



''
