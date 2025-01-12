{ pkgs, colorscheme, ... }:
{
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock;
    settings = {
      disable_loading_bar = false;
      hide_cursor = false;
      grace = 0;
      ignore_empty_input = false;
    };
  };
}
