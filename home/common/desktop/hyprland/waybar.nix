{ pkgs, ... }:

{
  services.network-manager-applet.enable = true;
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [ "tray" "wireplumber" "memory" "cpu" "battery" "clock" ];

        "clock" = {
          format = "{:%H:%M}  ";
          format-alt = "{:%A, %B %d, %Y (%R)}  ";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            "mode" = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            "on-click-right" = "mode";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            "on-click-right" = "mode";
            "on-click-forward" = "tz_up";
            "on-click-backward" = "tz_down";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };
        "battery" = {
          bat = "BAT1";
          adapter = "ADP1";
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          max-length = 25;
        };
        "wireplumber" = {
          format = "{volume}% {icon}";
          format-muted = "";
          on-click = "pavucontrol";
          on-click-right = "amixer set Master toggle";
          format-icons = [ "" "" "" ];
          max-volume = 100;
          scroll-step = 1;
        };
        "cpu" = {
          interval = 10;
          format = "{usage}% ";
          max-length = 10;
          on-click = "xfce4-taskmanager";
          states = {
            high = 80;
            idle = 15;
            normal = 16;
          };
        };
        "memory" = {
          interval = 20;
          format = "{used}G ";
          max-length = 10;
        };
        "hyprland/workspaces" = {
          all-outputs = true;
          format = "{name}: {icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            active = "";
            default = "";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";

          persistent-workspaces = {
            "*" = 5;
          };
        };
        "tray" = {
          icon-size = 21;
          spacing = 10;

        };
      };
    };
    style = ''

      * {
        border: none;
        border-radius: 0;
        font-family: JetBrains Nerd Font, monospace;
        font-weight: bold;
        font-size: 14px;
        min-height: 0;
      }

      #battery {
        color: #a6e3a1;
        border-radius: 0 10px 10px 0;
        margin-right: 10px;
        border-left: 0px;
      }
      #battery.warning {
        color: #FF5500;
      }
      #battery.critical {
        color: #FF0000;
      }
      #battery.discharging {
        color: #3067dd;
      }

      #cpu.high {
        color: #FF1111;
      }
      #cpu.idle {
        color: #30dd47;

      }
      cpu.normal {
        color: #1faf43;
      }
      #workspaces {
    background: #1e1e2e;
    border-radius: 10px;
    margin-left: 10px;
    padding-right: 0px;
    padding-left: 5px;
}
      #workspaces button {
        padding: 5px;
        color: #313244;
        margin-right: 5px;
      }

      #workspaces button.active {
        color: #a6adc8;
      }

#workspaces button.focused {
              color: #a6adc8;
              background: #eba0ac;
              border-radius: 10px;
              }

#workspaces button.urgent {
              color: #11111b;
              background: #a6e3a1;
              border-radius: 10px;
              }

#workspaces button:hover {
              background: #11111b;
              color: #cdd6f4;
              border-radius: 10px;
              }



    '';

  };
}
