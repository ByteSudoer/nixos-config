{ pkgs, font, ... }:
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock;
    settings = {
      #BackGround Image
      image = "$HOME/nixos-config/Wallpapers/gruvbox/random.jpg";

      #Configure Font
      font = "${font}";
      font-size = 14;

    };
  };
}
