{ pkgs, ... }:
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock;
    settings = {
      #BackGround Image
      image = "$HOME/nixos-config/Wallpapers/kernel.png";

      #Configure Font
      font = "JetBrains Mono";
      font-size = 14;

    };
  };
}
