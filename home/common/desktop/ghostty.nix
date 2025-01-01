{ pkgs, colorscheme, ... }:
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
    enable = true;
    package = pkgs.unstable.ghostty;
    config = {
      theme = "${theme}";

      #Mouse config
      mouse-hide-while-typing = true;
      mouse-shift-capture = true;
      mouse-scroll-multiplier = 1;

      #GTK config
      gtk-titlebar = false;
      gtk-tabs-location = "top";
      # desktop-notifications = true;
      bold-is-bright = true;

    };
  };
}
