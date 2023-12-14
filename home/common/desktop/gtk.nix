{ pkgs, colorscheme, ... }:

let
  themeConfig = if colorscheme == "dracula" then
    {
      cursorTheme = {
        package = pkgs.dracula-theme;
        name = "Dracula";
      };
      theme = {
        package = pkgs.dracula-theme;
        name = "Dracula";
      };
      iconTheme = {
        package = pkgs.dracula-icon-theme;
        name = "Dracula";
      };
    }
  else if colorscheme == "gruvbox" then
    {
      cursorTheme = {
        package = pkgs.capitaine-cursors-themed;
        name = "Capitaine Cursors (Gruvbox)";
      };
      theme = {
        package = pkgs.gruvbox-gtk-theme;
        name = "Gruvbox-Dark-B";
      };
      iconTheme = {
        package = pkgs.gruvbox-dark-icons-gtk;
        name = "oomox-gruvbox-dark";
      };
    }
  else
    {
      # Default configuration or handle other color schemes
    };
in
{
  gtk = {
    enable = true;
    inherit (themeConfig) cursorTheme theme iconTheme;
  };
}

