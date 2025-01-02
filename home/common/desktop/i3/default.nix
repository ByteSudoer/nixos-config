{
  pkgs,
  lib,
  config,
  colorscheme,
  terminal,
  font,
  browser,
  ...
}:
let
  inherit (config.xsession.windowManager.i3.config) modifier;
  altModifier = "Mod1";
  gapValue = 5;

  workspace1 = "1: Linux ";
  workspace2 = "2: Web ";
  workspace3 = "3: Music ";
  workspace4 = "4: Files ";
  workspace6 = "6: Virt ";

  colorsConfiguration =
    if colorscheme == "dracula" then
      {
        background = "#F8F8F2";
        focused = {
          background = "#6272A4";
          border = "#6272A4";
          childBorder = "#6272A4";
          indicator = "#6272A4";
          text = "#F8F8F2";
        };
        focusedInactive = {
          background = "#44475A";
          border = "#44475";
          childBorder = "#44475";
          indicator = "#44475";
          text = "#F8F8F2";
        };
        placeholder = {
          background = "#282A36";
          border = "#282A36";
          childBorder = "#282A36";
          indicator = "#282A36";
          text = "#F8F8F2";
        };
        unfocused = {
          background = "#282A36";
          border = "#282A36";
          childBorder = "#282A36";
          indicator = "#282A36";
          text = "#BFBFBF";
        };
        urgent = {
          background = "#FF5555";
          border = "#44475A";
          childBorder = "#FF5555";
          indicator = "#FF5555";
          text = "#F8F8F2";
        };

      }
    else
      {
        background = "#282828";
        focused = {
          background = "#282828";
          border = "#98971";
          childBorder = "#1d2021";
          indicator = "#b16286";
          text = "#1d2021";
        };
        focusedInactive = {
          background = "#1d2021";
          border = "#1d2021";
          childBorder = "#1d2021";
          indicator = "#b16286";
          text = "#d79921";
        };
        placeholder = {
          background = "#282A36";
          border = "#282A36";
          childBorder = "#282A36";
          indicator = "#282A36";
          text = "#F8F8F2";
        };
        unfocused = {
          background = "#1d2021";
          border = "#1d2021";
          childBorder = "#1d2021";
          indicator = "#b16286";
          text = "#d79921";
        };
        urgent = {
          background = "#cc241d";
          border = "#cc241d";
          childBorder = "#cc241d";
          indicator = "#cc241d";
          text = "#F8F8F2";
        };

      };

in

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;

    config = {
      terminal = "${terminal}";
      ## Super Key
      modifier = "Mod4";

      colors = colorsConfiguration;
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
        names = [ "${font}" ];
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

      window = {
        titlebar = false;
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
        #Applications
        {
          command = "discord --start-minimized";
          notification = false;
        }
        {
          command = "ferdium";
          notification = false;
        }
        {
          command = "flameshot";
          notification = false;
        }
        {
          command = "dropbox";
          notification = false;
        }

        ### Tray
        {
          command = "nm-applet";
          notification = false;
        }
        {
          command = "numlockx on";
          always = true;
          notification = false;
        }
        {
          command = "volumeicon";
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

        #Move aroun workspaces
        "${altModifier}+Shift+l" = "workspace next";
        "${altModifier}+Shift+h" = "workspace prev";
        "${altModifier}+Tab" = "workspace back_and_forth";

        #Toggling fullsceen
        "${modifier}+f" = "fullscreen toggle";

        # toggle tiling / floating
        #"${modifier}+space" = "floating toggle";

        # Change modes
        "${modifier}+r" = "mode resize";

        # Lock Screen
        "F12" = "exec lock";

        #Workspaces
        "${modifier}+1" = "workspace number ${workspace1}";
        "${modifier}+2" = "workspace number ${workspace2}";
        "${modifier}+3" = "workspace number ${workspace3}";
        "${modifier}+4" = "workspace number ${workspace4}";
      };
      assigns = {
        "${workspace2}" = [ { class = "firefox$"; } ];
        "${workspace3}" = [ { class = "Spotify"; } ];
        "${workspace4}" = [ { class = "Thunar"; } ];
        "${workspace6}" = [
          { class = "Virt-manager"; }
          { class = "VirtualBox Manager"; }
        ];
      };
      focus = {
        followMouse = true;
        newWindow = "focus";
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
      bars = [

        {
          statusCommand = "${pkgs.i3blocks}/bin/i3blocks -c $HOME/.config/i3blocks/bottom";
          trayOutput = "primary";
        }

      ];
    };
    extraConfig = ''
      #Display the popup if it belongs to the fullscreen application only
      popup_during_fullscreen smart
      # Only initiate a tiling drag when the modifier is held:
      tiling_drag modifier
    '';

  };

  # i3status bar configuration
  # programs.i3status = {
  #   enable = true;
  #   enableDefault = false;
  #   package = pkgs.i3status;
  #
  #   modules = {
  #     "time" = {
  #       position = 6;
  #       settings = {
  #         format = "%Y-%m-%d  %H:%M:%S";
  #       };
  #
  #     };
  #     "disk /" = {
  #       position = 5;
  #       settings = {
  #         format = " %avail";
  #       };
  #
  #     };
  #     "cpu_usage" = {
  #       position = 4;
  #       settings = {
  #         format = ": %usage";
  #         max_threshold = 75;
  #       };
  #
  #     };
  #     "memory" = {
  #       position = 3;
  #       settings = {
  #         memory_used_method = "classical";
  #         format = "RAM :: %used / %total";
  #
  #       };
  #     };
  #     "battery BAT0" = {
  #       position = 2;
  #       settings = {
  #         format = "BAT0 ⚡: %percentage";
  #         threshold_type = "percentage";
  #         low_threshold = 10;
  #       };
  #     };
  #     "wireless wlp0s20f3" = {
  #       position = 1;
  #       settings = {
  #         format_up = " (%quality) %ip";
  #         format_down = "WLS: down";
  #       };
  #     };
  #     "ethernet enp0s31f6:" = {
  #       position = 1;
  #       settings = {
  #         format_up = "(%speed) %ip";
  #         format_down = "ETH: down";
  #       };
  #     };
  #   };
  #
  # };
  programs.i3blocks = {
    enable = true;
    package = pkgs.i3blocks;
    bars = {
      # top = {
      #   title = {
      #     interval = "persist";
      #     command = "${pkgs.xtitle}/bin/xtitle -";
      #   };
      # };
      bottom = {

        music = {
          command = "${pkgs.spotify-cli-linux}/bin/spotifycli --status | xargs echo ";
          interval = 2;
        };
        memory = lib.hm.dag.entryAfter [ "music" ] {
          command = "free -h | awk '/Mem:/ { printf(\" 🐏 %5s/%s \\n\", $3, $2) }'";
          interval = 1;
          color = "#FEC925";
        };
        disk = lib.hm.dag.entryAfter [ "memory" ] {
          command = "df -h / | awk '/\\//{ printf(\" 💾 %4s/%s \\n\", $4, $2) }'";
          interval = 2;
          color = "#C9E3D8";
        };
        battery = lib.hm.dag.entryAfter [ "disk" ] {
          command = "battery_info";
          interval = 2;
        };
        weather = lib.hm.dag.entryAfter [ "battery" ] {
          command = "curl -Ss 'https://wttr.in?0&T&Q' | cut -c 16- | head -2 | xargs echo";
          interval = 3600;
        };
        date = lib.hm.dag.entryAfter [ "weather" ] {
          command = "date +\" %a, %d %b  %H:%M:%S\"";
          interval = 1;
        };

      };
    };
  };

}
