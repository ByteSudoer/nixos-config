{ pkgs, ... }:
{
  #Configure Zathura
  programs.zathura = {
    enable = true;
    package = pkgs.zathura;
    extraConfig = ''
      set recolor true
      set recolor_darkcolor #BDE090
      set recolor_lightcolor #000000
      set selection-clipboard clipboard
    '';

  };
}
