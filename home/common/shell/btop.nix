{ pkgs, colorscheme, ... }:
let
  palette =
    if colorscheme == "dracula" then
      "tokyo-night"
    else if colorscheme == "gruvbox" then
      "gruvbox_material_dark"
    else
      "Default";
in
{
  programs.btop = {
    enable = true;
    package = pkgs.btop;
    settings = {
      color_theme = "${palette}";
      update_ms = 1500;
      truecolor = true;
      rounded_corners = true;
      shown_boxes = "proc cpu mem net";
    };
  };
}
