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

        #Change focus
        "${modifier}+h" = "focus left";
        "${modifier}+l" = "focus right";
        "${modifier}+k" = "focus up";
        "${modifier}+j" = "focus down";
        #Change Focus using cursor/arrow keys 
        "${modifier}+113" = "focus left";
        "${modifier}+114" = "focus right";
        "${modifier}+111" = "focus up";
        "${modifier}+116" = "focus down";

        #Toggling fullsceen
        "${modifier}+f" = "fullsceen toggle global";
        # Lock Screen
        "F12" = "exec lock";
      };
    };

  };

  # i3status bar configuration
  programs.i3status = {
    enable = true;
    enableDefault = false;
    package = pkgs.i3status;

  };

}
