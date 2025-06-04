{ pkgs, ... }:
pkgs.writeShellScriptBin "lock" ''
  #!/usr/bin/env bash

    if [ "$WAYLAND_DISPLAY" ]; then
      lock_command="hyprlock"
    else
      lock_command="${pkgs.betterlockscreen}/bin/betterlockscreen -l"
    fi


    ${pkgs.alsa-utils}/bin/amixer set Master mute
    ${pkgs.alsa-utils}/bin/amixer set Capture nocap

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

  #Unmute Output
  ${pkgs.alsa-utils}/bin/amixer set Master unmute
''
