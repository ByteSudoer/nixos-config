{ inputs, colorscheme, config, ... }:
let
  color = if colorscheme == "dracula" then "dracula" else if colorscheme == "gruvbox" then "gruvbox-dark-hard" else "Dracula";
in

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];
  colorScheme = inputs.nix-colors.colorSchemes.${color};
  services.network-manager-applet.enable = true;
  programs.waybar = {
    enable = true;
    # systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        modules-left = [ "custom/logout" "custom/weather" "custom/spotify" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "custom/notifhistory" "tray" "wireplumber" "bluetooth" "network" "memory" "cpu" "battery" "clock" ];

        "clock" = {
          format = "{:%H:%M}  ";
          format-alt = "{:%A, %B %d, %Y (%R)}";
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
        "network" = {
          # interface = "wlp2s0";
          format = "{ifname}";
          format-wifi = "({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} 󰊗";
          format-disconnected = "";
          tooltip-format = "{ifname} via {gwaddr} 󰊗";
          tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          tooltip-format-ethernet = "{ifname} ";
          tooltip-format-disconnected = "Disconnected";
          max-length = 50;
        };
        bluetooth = {
          format = " {status}";
          format-connected = " {device_alias}";
          format-connected-battery = " {device_alias} {device_battery_percentage}%";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          on-click = "blueberry";
        };
        wireplumber = {
          format = "{volume}% {icon}";
          format-muted = "";
          on-click = "pavucontrol";
          on-click-right = "amixer set Master toggle";
          format-icons = [ "" "" "" ];
          max-volume = 100;
          scroll-step = 1;
        };
        cpu = {
          interval = 1;
          format = "{usage}% ";
          max-length = 10;
          on-click = "xfce4-taskmanager";
          states = {
            high = 80;
            idle = 15;
            normal = 16;
          };
        };
        memory = {
          interval = 5;
          format = "{used}G ";
          max-length = 10;
        };
        "hyprland/workspaces" = {
          all-outputs = true;
          format = "{name}: {icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";

          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
            "6" = [ ];
          };
        };
        tray = {
          icon-size = 21;
          spacing = 10;
        };
        "custom/logout" = {
          format = "󱄅 ByteSudoer";
          on-click = "wlogout";
          on-click-right = "killall wlogout";
        };
        "custom/weather" = {
          exec = "get_weather Tunis+Tunisia";
          return-type = "json";
          format = "{}";
          tooltip = true;
          interval = 3600;
        };
        "custom/spotify" = {
          format = "{icon} {}";
          escape = true;
          return-type = "json";
          max-length = 40;
          # interval = 30;
          on-click = "playerctl -p spotify play-pause";
          on-click-right = "killall .spotify-wrapped";
          smooth-scrolling-threshold = 10;
          on-scroll-up = "sp next";
          on-scroll-down = "sp previous";
          exec = "waybar-mediaplayer --player spotify 2> /dev/null";
          exec-if = "pgrep spotify";
        };
        "custom-notifhistory" = {
          exec = "dunstctl history";
          return-type = "json";
          format = "{icon} {}";

          # format-icons = {
          #   none = "";
          # };
        };
        "custom/notification" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
      };
    };
    style = ''

    * {
	border: none;
	border-radius: 10px;
    font-family: "JetBrainsMono Nerd Font" ;
	font-size: 15px;
	min-height: 10px;
}

window#waybar {
	background: transparent;
}

window#waybar.hidden {
	opacity: 0.2;
}

#window {
	margin-top: 6px;
	padding-left: 10px;
	padding-right: 10px;
	border-radius: 10px;
	transition: none;
    color: transparent;
	background: transparent;
}
#workspaces {
	margin-top: 6px;
	margin-left: 12px;
	font-size: 4px;
	margin-bottom: 0px;
	border-radius: 10px;
	background: #${config.colorScheme.palette.base00};
	transition: none;
}
#workspaces button.active {

  background: #${config.colorScheme.palette.base09};
}
#network {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	padding-right: 10px;
	margin-bottom: 0px;
	border-radius: 10px;
	transition: none;
	color: #${config.colorScheme.palette.base00};
	background: #${config.colorScheme.palette.base09};
}

#wireplumber {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	padding-right: 10px;
	margin-bottom: 0px;
	border-radius: 10px;
	transition: none;
	color: #${config.colorScheme.palette.base00};
	background: #${config.colorScheme.palette.base0B};
}

#battery {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	padding-right: 10px;
	margin-bottom: 0px;
	border-radius: 10px;
	transition: none;
	color: #${config.colorScheme.palette.base00};
	background: #${config.colorScheme.palette.base0C};
}

#battery.charging, #battery.plugged {
	color: #${config.colorScheme.palette.base00};
    background-color: #${config.colorScheme.palette.base04};
}

#battery.critical:not(.charging) {
    background-color: #${config.colorScheme.palette.base04};
    color: #fb4943;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

@keyframes blink {
    to {
        background-color: #BF616A;
        color: #B5E8E0;
    }
}

#backlight {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	padding-right: 10px;
	margin-bottom: 0px;
	border-radius: 10px;
	transition: none;
	color: #161320;
	background: #F8BD96;
}
#clock {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	padding-right: 10px;
	margin-bottom: 0px;
	border-radius: 10px;
	transition: none;
	color: #${config.colorScheme.palette.base00};
  background: #${config.colorScheme.palette.base0D};
	/*background: #1A1826;*/
}

#memory {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	margin-bottom: 0px;
	padding-right: 10px;
	border-radius: 10px;
	transition: none;
	color: #161320;
	background: #${config.colorScheme.palette.base0A};
}
#cpu {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	margin-bottom: 0px;
	padding-right: 10px;
	border-radius: 10px;
	transition: none;
	color: #161320;
	background: #${config.colorScheme.palette.base0E};
}
#bluetooth {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	margin-bottom: 0px;
	padding-right: 10px;
	border-radius: 10px;
	transition: none;
	color: #161320;
	background: #${config.colorScheme.palette.base05};
}

#tray {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	margin-bottom: 0px;
	padding-right: 10px;
	border-radius: 10px;
	transition: none;
	color: #B5E8E0;
	background: #161320;
}
  #custom-logout {
	font-size: 14px;
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	padding-right: 5px;
	border-radius: 10px;
	transition: none;
    color: #${config.colorScheme.palette.base09};
    background: #161320;
}
#custom-weather {

	font-size: 14px;
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	padding-right: 5px;
	border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#custom-spotify {

    font-size: 14px;
    margin-top: 6px;
    margin-left: 8px;
    padding-left: 10px;
    padding-right: 5px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #44475a;
  }
#custom-notification {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	margin-bottom: 0px;
	padding-right: 10px;
	border-radius: 10px;
  transition: none;
	background: #161320;
  font-size: 14px;
  font-family: "JetBrainsMono Nerd Font";
}
#custom-notifhistory{
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	margin-bottom: 0px;
	padding-right: 10px;
	border-radius: 10px;
    transition: none;
	background: #161320;
  font-size: 14px;
    font-family: "JetBrainsMono Nerd Font";

}
    '';

  };
}
