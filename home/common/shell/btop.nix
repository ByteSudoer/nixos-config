{ pkgs, colorscheme, desktop, ... }:
let
  palette =
    if colorscheme == "dracula"
    then "dracula"
    else if colorscheme == "gruvbox"
    then "gruvbox_material_dark"
    else "default";
  isDesktop = builtins.isString desktop;
in
{
  programs.btop = {
    enable = true;
    package = pkgs.btop;
    settings = {
      color_theme = "${palette}";
      update_ms = 1500;
    };
  };
}
