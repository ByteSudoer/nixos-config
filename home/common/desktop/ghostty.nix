{
  pkgs,
  colorscheme,
  font,
  ...
}:
let
  theme =
    if colorscheme == "dracula" then
      "tokyonight-storm" # Or Dracula
    else if colorscheme == "gruvbox" then
      "GruvboxDarkHard"
    else
      "tokyonight-storm";
in

{
  programs.ghostty = {
    enable = false;
    package = pkgs.unstable.ghostty;

    #Shell integration
    shellIntegration.enable = false;
    shellIntegration.enableBashIntegration = true;
    settings = {
      theme = "${theme}";

      ############Font config
      font-size = 11;
      font-family = "${font}";

      ############Global config
      title = "ByteSudoer";
      resize-overlay = "after-first";
      resize-overlay-position = "center";
      resize-overlay-duration = "1s500ms";
      auto-update = "off";

      ############Clipboard config
      clipboard-read = "allow";
      clipboard-write = "allow";
      clipboard-paste-protection = true;
      copy-on-select = true;

      ############Mouse config
      mouse-hide-while-typing = true;
      mouse-shift-capture = true;
      mouse-scroll-multiplier = 1;

      ############GTK config
      gtk-titlebar = true;
      gtk-tabs-location = "hidden";
      gtk-adwaita = true;
      window-theme = "system";
      desktop-notifications = true;
      bold-is-bright = true;
      window-decoration = false;

    };

    #Keybindings config
    clearDefaultKeybindings = true;
    keybindings = {
      # "ctrl+space>r" = "reload_config";
      # #Tab Navigation
      # "ctrl+space>c" = "new_tab";
      # "ctrl+space>h" = "previous_tab";
      # "ctrl+space>l" = "next_tab";
      #Font size Manipulation
      "ctrl+shift+plus" = "increase_font_size:1";
      "ctrl+shift+minus" = "decrease_font_size:1";
    };
  };
}
