{ pkgs, ... }:
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock;
    settings = {
      #BackGround Image
      image = "$HOME/nixos-config/Wallpapers/gruvbox/random.jpg";

      #Configure Font
      font = "JetBrains Mono";
      font-size = 14;

    };
  };
}
