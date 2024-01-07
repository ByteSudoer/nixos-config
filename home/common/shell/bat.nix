{ pkgs, colorscheme, ... }:
let
  color = if colorscheme == "dracula" then "Dracula" else if colorscheme == "gruvbox" then "gruvbox-dark" else "Dracula";
in
{
  # Configure Bat
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "${color}";
    };
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
  };


}
