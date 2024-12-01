{ pkgs, colorscheme, ... }:

let
  themeConfig =
    if colorscheme == "dracula" then
      {
        cursorTheme = {
          package = pkgs.nordic;
          name = "Norcdic";
        };
        theme = {
          package = pkgs.nordic;
          name = "Nordic";
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
          name = "Gruvbox-Dark";
        };
        iconTheme = {
          package = pkgs.arc-icon-theme;
          name = "Arc";
        };
      }
    else
      {
        # Default configuration or handle other color schemes
      };
in
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.nordic;
    name = "Nordic";
    size = 16;
    x11.enable = true;
  };
  gtk = {
    enable = true;
    font = {
      name = "JetBrains Mono";
      size = 10;

    };

    inherit (themeConfig) cursorTheme theme iconTheme;
  };
}
