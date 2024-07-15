#!/usr/bin/env bash
#
#
#

MONITORS=( $(xrandr --listactivemonitors | grep -E '^ [0-9]+:' | cut -d' ' -f6 | sed 's/\n/ /') )
MONITOR="${MONITOR:-${MONITORS[0]}}"

# Only have workspaces for primary monitor
bspc monitor "$MONITOR" -d {1,2,3,4,5}
for mon in "${MONITORS[@]:1}"; do
  bspc monitor "$mon" -d 0
done

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


