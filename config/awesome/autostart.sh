#!/usr/bin/env bash

function run {
	if ! pgrep $1; then
		$@ &
	fi

}

run defaultLayout
run fehrandom
run wallpapers
run nm-applet &
#run caffeine
# run variety
# run xfce4-power-manager
# run blueberry-tray
run numlockx on &
# run volumeicon
# run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#run /usr/lib/xfce4/notifyd/xfce4-notifyd &

# run defLayout
# run conky -c $HOME/.config/awesome/system-overview
#you can set wallpapers in themes as well
# feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &
#run applications from startup
#run firefox
#run atom
run dropbox &
#run insync start
#run spotify
#run ckb-next -b
run discord --start-minimized &
run ferdium &
run flameshot &
# run birdtray &
#run telegram-desktop
# Launch polybar
# "$HOME"/.config/polybar/launch.sh &
# run dropbox &
# restart_window_manager &
