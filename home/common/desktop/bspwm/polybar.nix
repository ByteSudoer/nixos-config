{ pkgs, ... }:
let
  colors = {
    background = "#282A2E";
    background-alt = "#373B41";
    foreground = "#C5C8C6";
    foreground-alt = "#C5C8C6";
    primary = "#F0C674";
    secondary = "#8ABEB7";
    alert = "#A54242";
    disabled = "#707880";
  };
in
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar;
    config = {
      "colors" = colors;
      "bar/mainbar-bspwm" = {
        width = "100%";
        height = "24pt";
        radius = 6;
        background = "${colors.background}";
        foreground = "${colors.foreground}";
        line-size = "3pt";
        border-size = "4pt";
        border-color = "#00000000";
        padding-left = " 0 ";
        padding-right = " 1 ";
        module-margin = "1";
        separator = "|";
        separator-foreground = "${colors.disabled}";
        font-0 = "JetBrainsMono Nerd Font Mono";
        modules-left = "xworkspaces";
        modules-center = "xwindow kernel";
        modules-right = " tray network filesystem memory cpu clock";
        cursor-click = "pointer";
        cursor-scroll = "ns-resize";
        enable-ipc = "true";
      };
      "module/xworkspaces" = {
        type = "internal/xworkspaces";
        label-active = "%name%";
        label-active-background = "${colors.background-alt}";
        label-active-underline = "${colors.primary}";
        label-active-padding = "1";
        label-occupied = "%name%";
        label-occupied-padding = "1";
        label-urgent = "%name%";
        label-urgent-background = "${colors.alert}";
        label-urgent-padding = "1";
        label-empty = "%name%";
        label-empty-foreground = "${colors.disabled}";
        label-empty-padding = "1";
      };
      "module/filesystem" = {
        type = "internal/fs";
        interval = "25";
        mount-0 = "/";
        label-mounted = "%{F#F0C674}%mountpoint%%{F-} %percentage_used%%";
        label-unmounted = "%mountpoint% not mounted";
        label-unmounted-foreground = "${colors.disabled}";
      };
      "module/memory" = {
        type = "internal/memory";
        interval = "2";
        format-prefix = "";
        format-prefix-foreground = "${colors.foreground-alt}";
        format-underline = "#4bffdc";
        label = "%percentage_used%%";
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = "2";
        format-prefix = "󰍛";
        format-prefix-foreground = "${colors.foreground-alt}";
        format-underline = "#f90000";
        label = "%percentage:2%%";
      };

      "module/network" = {
        type = "internal/network";
        interface-type = "wired";
        interface = "enp1s0";
        label-connected = "%{F#F0C674}%ifname%%{F-} %local_ip%";
      };

      "module/clock" = {
        type = "internal/date";
        date = "%%{T3}%Y-%m-%d %H:%M:%S%{T-}";
      };

      "module/tray" = {
        type = "internal/tray";
        tray-size = "20";
        tray-padding = "2";
        tray-offset-x = "0";
        tray-offset-y = "0";
        tray-foreground = "${colors.foreground}";
        tray-background = "${colors.background}";
        format-background = "${colors.background}";
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title%";
        label-maxlen = "30";
      };
      "module/kernel" = {
        type = "custom/script";
        exec = "uname -r";
        tail = "false";
        interval = "1024";
        format-foreground = "${colors.foreground}";
        format-background = "${colors.background}";
        format-prefix = "";
        format-prefix-foreground = "#0084FF";
        format-underline = "#0084FF";
      };

    };
    script = "
      polybar
      mainbar-bspwm &
    ";
  };
}
