{ colorscheme, desktop, lib, ... }:
let
  isHyprland = desktop: lib.toUpper desktop == "HYPRLAND";
  config_file = ../../../../config/dunst/dunst_${colorscheme};
in
{
  services.dunst = {
    enable = isHyprland desktop;
  };

  xdg.configFile."dunst/dunstrc" = {
    source = config_file;
  };
}
