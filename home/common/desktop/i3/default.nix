{ pkgs, config, ... }:
let

  modifier = config.xsession.windowManager.i3.config.modifier;
in

{
  xsession.windowManager.i3 = {
    config = {
      ## Super Key
      modifier = "Mod4";
      terminal = "alacritty";
      startup = [
        ### Wallpapers
        {
          command = "fehrandom";
          always = true;
          notification = false;
        }
        {
          command = "wallpapers";
          always = true;
          notification = false;
        }
        ### Tray
        {
          command = "nm-applet";
          notification = false;
        }

        {
          command = "volumeicon";
          notification = false;
        }

        {
          command = "numlockx on";
          always = true;
          notification = false;
        }
      ];
      keybindings = {
        "${modifier}+Return" = "exec alacritty";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+w" = "exec firefox";
        "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";
      };
    };

  };
}
