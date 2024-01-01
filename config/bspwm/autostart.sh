#!/bin/sh
#
#

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

defaultLayout &
run sxhkd -c ~/.config/sxhkd/sxhkdrc &
run fehrandom &
run wallpapers &

run polybar &

numlockx on &
run nm-applet &
run volumeicon &


