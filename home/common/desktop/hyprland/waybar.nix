{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [ "memory" "cpu" "battery" ];
        "battery" = {
          bat = "BAT1";
          adapter = "ADP1";
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          max-length = 25;
        };
        "cpu" = {
          interval = 10;
          format = "{usage}% ";
          max-length = 10;
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
          persistent-workspaces = {
            "*" = 5;
          };
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


    '';

  };
}
