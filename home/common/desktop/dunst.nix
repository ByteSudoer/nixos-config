{ colorscheme, desktop, ... }:
let

  isInList = element: list: builtins.elem element list;
  windowManagers = [
    "bspwm"
    "i3"
    "hyprland"
    "awesome"
  ];
  config_file = ../../../config/dunst/dunst_${colorscheme};
in
{
  services.dunst = {
    enable = isInList desktop windowManagers;
  };

  xdg.configFile."dunst/dunstrc" = {
    source = config_file;
  };
}
