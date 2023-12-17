#!/bin/sh
#
#

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run sxhkd -c ~/.config/sxhkd/sxhkdrc &
run fehrandom &
run wallpapers &

numlockx on &
run nm-applet &
run volumeicon &


