{ pkgs, ... }:
pkgs.writeShellScriptBin "lock" ''
  #!/usr/bin/env bash 

    image=/home/bytesudoer/Pictures/Wallpapers/dracula/kernel.png
    if [ "$WAYLAND_DISPLAY" ]; then
      lock_command="swaylock"
    else
      lock_command="betterlockscreen -l"
    fi


    amixer set Master mute
  ## Test if spotify is running and pause song
    if [[ $(pgrep spotify) ]];then
      sp pause
    fi

  ## Test if clementine is running and pause song
    if [[ $(pgrep clementine) ]];then
      clementine --pause
    fi
  ##### Run Lock Command
  $lock_command
  #

  ## When testing use the --no-verify option
  ##### Use i3lock
  # i3lock -i "$image" --fill --pointer=win --show-failed-attempts 
  amixer set Master unmute
''
