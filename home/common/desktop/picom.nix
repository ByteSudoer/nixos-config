{ desktop, pkgs, ... }:
let

  isInList = element: list: builtins.elem element list;
  windowManagers = [
    "i3"
    "bspwm"
    "awesome"
  ];
in
{
  services.picom = {
    enable = isInList desktop windowManagers;
    package = pkgs.picom;
    backend = "xrender";
    extraArgs = [ "--experimental-backends" ];
    # vSync = true;
    # Opacity
    activeOpacity = 1.0;
    inactiveOpacity = 0.8;
    opacityRules = [
      "100:class_g    = 'Bar'" # lemonbar
      "100:class_g    = 'slop'" # maim
      "100:class_g    = 'XTerm'"
      "100:class_g    = 'URxvt'"
      # "100:class_g	  = 'Alacritty' && 'kitty' && focused"
      "80:class_g	  = 'kitty' && !focused"
      "90:class_g    = 'Alacritty'"
      "100:class_g    *?= 'code-oss'"
      "100:class_g    = 'Meld'"
      "100:class_g    = 'TelegramDesktop'"
      "100:class_g    = 'Joplin'"
      "100:class_g     ?= 'firefox'"
      "100:class_g    = 'Thunderbird'"
      "90:class_g     = 'Thunar'"
      "90:class_g     *?= 'rofi'"
      "90:class_g     *?= 'discord'"
      "100:class_g     *?= 'spotify'"
      "90:class_g     *?= 'obsidian'"
      "90:class_g     *?= 'bitwarden'"
      "90:class_g     *?= 'VsCodium'"
    ];
    # Fading
    fade = false;
    fadeSteps = [
      3.0e-2
      3.0e-2
    ];
    fadeExclude = [ "class_g = 'slop'" ];
    #Shadow
    shadow = false;
    # shadowOffsets = [
    #   -18
    #   -18
    # ];
    shadowExclude = [
      "class_g = 'Cairo-clock'"
      "class_g = 'CoverGloobus'"
      "class_g = 'Tilda'"
      "name ?= 'gnome-pie'"
      "class_g = 'Eclipse'"
      "class_g ?= 'Plank'"
      "name *= 'recordmydesktop'"
      "name = 'Notification'"
      "name = 'Docky'"
      "name = 'Kupfer'"
      "name = 'xfce4-notifyd'"
      #    "name *= 'VLC'"
      "name *= 'Chromium'"
      "name *= 'Chrome'"
      "class_g = 'Firefox' && argb"
      "class_g = 'Conky'"
      "class_g = 'Kupfer'"
      "class_g = 'Synapse'"
      "class_g ?= 'Notify-osd'"
      "class_g ?= 'Cairo-dock'"
      "class_g ?= 'Xfce4-notifyd'"
      "class_g ?= 'Xfce4-power-manager'"
      # "_GTK_FRAME_EXTENTS@:c"
      # "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
    ];
    #Settigs
    settings = {
      blur = {
        method = "dual_kawase";
        strength = 5;
        background = false;
        background-frame = false;
        background-fixed = false;
        kern = "3x3box";
      };
      blur-background-exclude = [
        "(class_g = 'firefox' || class_g = 'Firefox' || class_g = 'Thunderbird') && (window_type = 'utility' || window_type = 'popup_menu') && argb"
      ];
    };
  };
}
