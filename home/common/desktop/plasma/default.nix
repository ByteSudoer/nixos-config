{
  font,
  terminal,
  browser,
  pkgs,
  colorscheme,
  username,
  ...
}:
let
  selected_font = "JetBrains Mono";
in
{
  programs.plasma = {
    enable = true;
    #   immutableByDefault = true;
    #   overrideConfig = true;
    #
    hotkeys.commands = {
      "launch-web-browser" = {
        name = "Launch Browser";
        key = "Meta+w";
        command = "${browser}";
      };
      "launch-termainl" = {
        name = "Launch Terminal";
        key = "Meta+Return";
        command = "${terminal}";
      };
      "launch-file-manager" = {
        name = "Launch File Manager";
        key = "Meta+Shift+Return";
        command = "thunar";
      };
      "launch-xfce-app-finder" = {
        name = "Launch XFCE app finder";
        key = "Meta+<";
        command = "xfce4-appfinder";
      };
      "custom-lock-screen" = {
        name = "Lock Screen with betterlockscreen";
        key = "F12";
        command = "lock";
      };
    };
    input = {
      keyboard = {
        numlockOnStartup = "on";
        repeatDelay = 300;
        repeatRate = 25;
        layouts = [
          {
            displayName = "French Azerty";
            layout = "fr";
            variant = "AZERTY";
          }
        ];
      };
    };
    shortcuts = {
      kwin = {
        "Quick Tile Window to the Left" = "Meta+H";
        "Quick Tile Window to the Right" = "Meta+L";
        "Quick Tile Window to the Up" = "Meta+K";
        "Quick Tile Window to the Down" = "Meta+J";
      };
    };
    fonts = {
      general = {
        family = "${selected_font}";
        fixedPitch = true;
        pointSize = 10;
      };
      menu = {
        family = "${selected_font}";
        pointSize = 10;
      };
      fixedWidth = {
        family = "${selected_font}";
        pointSize = 10;
      };
      small = {
        family = "${selected_font}";
        pointSize = 10;
      };
      toolbar = {
        family = "${selected_font}";
        pointSize = 10;
      };
      windowTitle = {
        family = "${selected_font}";
        pointSize = 10;
      };
    };
    kscreenlocker = {
      appearance = {
        alwaysShowClock = true;
        showMediaControls = true;
        wallpaperSlideShow = {
          path = /home/${username}/nixos-config/Wallpapers/${colorscheme};
          interval = 300;
        };
      };
    };
    workspace = {
      colorScheme = "Nordic-darker";
      cursor = {
        size = 20;
        theme = "Nordic-cursors";
      };
      iconTheme = "Breeze Dark";

      wallpaperSlideShow = {
        interval = 300;
        path = /home/${username}/nixos-config/Wallpapers/${colorscheme};
      };

    };
  };
  # Okular PDF viewer
  programs.okular = {
    enable = true;
    package = pkgs.kdePackages.okular;
    general = {
      obeyDrm = true;
      openFileInTabs = true;
      smoothScrolling = true;
      viewMode = "Facing";
      zoomMode = "fitPage";
    };
    performance = {
      enableTransparencyEffects = true;
      memoryUsage = "Normal";
    };
  };

}
