{
  pkgs,
  colorscheme,
  font,
  terminal,
  ...
}:
let
  theme =
    if colorscheme == "Dracula" then
      "dracula"
    else if colorscheme == "gruvbox" then
      "GruvboxDarkHard"
    else
      "TokyoNightStorm";
in
{
  programs.ghostty = {
    enable = terminal == "ghostty";
    package = pkgs.ghostty;

    enableBashIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;

    # Global Settings
    settings = {
      font-family = "${font}";
      font-size = "11";

      #Appearance
      theme = "${theme}";

      #Cursor
      cursor-style = "block";
      cursor-style-blink = true;

      # Mouse config
      mouse-hide-while-typing = false;
      mouse-shift-capture = true;
      mouse-scroll-multiplier = 1;

      #Misc
      title = "ByteSudoer"; # Window Title
      scrollback-limit = 1000000;

      #Class for window managers
      window-decoration = false; # Disable native decorations
      class = "ghostty";
      x11-instance-name = "ghostty";

    };
  };
}
