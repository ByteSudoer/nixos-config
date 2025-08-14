{ pkgs, ... }:
{
  services.hyprpolkitagent = {
    enable = true;
    pkgs = pkgs.hyprpolkitagent;
  };
}
