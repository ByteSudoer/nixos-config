{ pkgs, ... }:
{
  programs.nix-init = {
    enable = true;
    package = pkgs.unstable.nix-init;
    settings = {
      maintainers = [ "ByteSudoer" ];
    };
  };
}
