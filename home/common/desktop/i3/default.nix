{
  pkgs,
  lib,
  config,
  ...
}:
let
  inherit (config.xsession.windowManager.i3.config) modifier;
  terminal = "alacritty";
  browser = "firefox";
  altModifier = "Mod1";
  gapValue = 5;
  workspace1 = "Linux: ";
  workspace2 = "Web: ";

in

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;

    config = {
      terminal = "alacritty";
      ## Super Key
      modifier = "Mod4";

      modes = {
        resize = {
          Down = "resize grow height 10 px or 10 ppt";
          j = "resize grow height 10 px or 10 ppt";
          Escape = "mode default";
          Left = "resize shrink width 10 px or 10 ppt";
          h = "resize shrink width 10 px or 10 ppt";
          Return = "mode default";
          Right = "resize grow width 10 px or 10 ppt";
          l = "resize grow width 10 px or 10 ppt";
          Up = "resize shrink height 10 px or 10 ppt";
          k = "resize shrink height 10 px or 10 ppt";
        };
      };
      fonts = {
        names = [ "JetBrains Mono" ];
        style = "Regular";
        size = 11.0;
      };
      gaps = {
        bottom = gapValue;
        top = gapValue;
        horizontal = gapValue;
        vertical = gapValue;
        inner = gapValue;
        outer = gapValue;
        left = gapValue;
        right = gapValue;
        smartBorders = "on";
        smartGaps = true;

      };
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
        "${modifier}+Return" = "exec ${terminal}";
        "${modifier}+Shift+Return" = "exec thunar";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+w" = "exec ${browser}";
        "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";
        "${modifier}+x" = "exec xfce4-appfinder";

        # kill focused window
        "${modifier}+c" = "kill";
        "${altModifier}+F4" = "kill";

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

        #Split in horizontal or vertical orientation
        "${altModifier}+h" = "split h";
        "${altModifier}+v" = "split v";

        #Move windows
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+l" = "move right";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+j" = "move down";

        #Toggling fullsceen
        "${modifier}+f" = "fullscreen toggle";

        # toggle tiling / floating
        #"${modifier}+space" = "floating toggle";

        # Change modes
        "${modifier}+r" = "mode resize";

        # Lock Screen
        "F12" = "exec lock";
      };
      focus = {
        followMouse = true;
        newWindow = "smart";
        mouseWarping = true;
      };
      floating = {
        criteria = [
          {
            class = "Pavucontrol";
          }
          {
            class = "Xfce4-appfinder";
          }
        ];
      };
    };
    extraConfig = ''
      #Display the popup if it belongs to the fullscreen application only
      popup_during_fullscreen smart
      # Only initiate a tiling drag when the modifier is held:
      tiling_drag modifier
    '';

  };

  # i3status bar configuration
  programs.i3status = {
    enable = true;
    enableDefault = true;
    package = pkgs.i3status;

  };

}
