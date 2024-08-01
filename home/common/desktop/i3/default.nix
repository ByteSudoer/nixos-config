{
  pkgs,
  lib,
  config,
  ...
}:
let
  modifier = config.xsession.windowManager.i3.config.modifier;
in

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
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
        {
          command = "defaultLayout";
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
      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec alacritty";
        "${modifier}+Shift+Return" = "exec thunar";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+w" = "exec firefox";
        "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";
        # Lock Screen
        "F12" = "exec lock";
      };
    };

  };

}
