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
    # immutableByDefault = true;
    # overrideConfig = true;
    # hotkeys.commands = {
    #   "custom-lock-screen" = {
    #     name = "Lock Screen with betterlockscreen";
    #     key = "F12";
    #     command = "lock";
    #   };
    # };
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
    # shortcuts = {
    #   "${browser}.desktop" = {
    #     "_launch" = "Meta+w";
    #   };
    #   "${terminal}.desktop" = {
    #     "_launch" = "Meta+Return";
    #   };
    #   "xfce4-appinder.desktop" = {
    #     "_launch" = "Meta+<";
    #   };
    #   "thunar.desktop" = {
    #     "_launch" = "Meta+Shift+Return";
    #   };
    #
    #   kwin = {
    #     "Expose" = "Meta+,";
    #     "Quick Tile Window to the Down" = "Meta+J";
    #     "Quick Tile Window to the Left" = "Meta+H";
    #     "Quick Tile Window to the Right" = "Meta+L";
    #     "Quick Tile Window to the Up" = "Meta+K";
    #   };
    # };
    # Panels
    # panels = [
    #   {
    #     alignment = "center";
    #     floating = true;
    #     hiding = "normalpanel";
    #     height = 34;
    #     lengthMode = "fill";
    #     location = "bottom";
    #     screen = 0;
    #     widgets = [
    #       "org.kde.plasma.kickoff"
    #       "org.kde.plasma.pager"
    #       "org.kde.plasma.icontasks"
    #       "org.kde.plasma.marginsseparator"
    #       "org.kde.plasma.systemtray"
    #       "org.kde.plasma.digitalclock"
    #       "org.kde.plasma.showdesktop"
    #     ];
    #   }
    #   {
    #     alignment = "center";
    #     floating = true;
    #     hiding = "normalpanel";
    #     height = 34;
    #     lengthMode = "fill";
    #     location = "bottom";
    #     screen = 1;
    #     widgets = [
    #       "org.kde.plasma.kickoff"
    #       "org.kde.plasma.pager"
    #       "org.kde.plasma.icontasks"
    #       "org.kde.plasma.marginsseparator"
    #       "org.kde.plasma.systemtray"
    #       "org.kde.plasma.digitalclock"
    #       "org.kde.plasma.showdesktop"
    #     ];
    #
    #   }
    # ];
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
      colorScheme = "BreezeDark";
      cursor = {
        size = 20;
        theme = "Breeze";
      };
      iconTheme = "Breeze Dark";
      # wallpaperSlideShow = {
      #   interval = 300;
      #   path = /home/${username}/nixos-config/Wallpapers/${colorscheme};
      # };
      # splashScreen = {
      #   theme = "Breeze";
      # };
    };
    # Config files
    configFile = {
      #Notification
      plasmanotifyrc = {
        Notifications = {
          PopupPosition = "TopRight";
        };
      };
    };
  };
  # Next configure Panels
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
