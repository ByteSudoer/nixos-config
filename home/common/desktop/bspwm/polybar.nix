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
        font-0 = "monospace;2";
        modules-left = "xworkspaces xwindow";
        modules-right = "filesystem pulseaudio xkeyboard memory cpu wlan eth date";
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
        format-prefix = " ";
        format-prefix-foreground = "${colors.foreground-alt}";
        format-underline = "#4bffdc";
        label = "%percentage_used%%";
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = "2";
        format-prefix = "";
        format-prefix-foreground = "${colors.foreground-alt}";
        format-underline = "#f90000";
        label = "%percentage:2%%";
      };
    };
    script = "
      polybar mainbar-bspwm &
    ";
  };
}
