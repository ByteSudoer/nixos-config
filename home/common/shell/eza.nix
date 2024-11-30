{ pkgs, ... }:
{
  programs.eza = {
    enable = true;
    package = pkgs.eza;
    enableBashIntegration = true;
    git = true;
    icons = "auto";
  };
}
