{ pkgs, ... }:
{
  programs.gh = {
    enable = true;
    package = pkgs.gh;
    extension = with pkgs;[
      gh-eco
    ];
  };
}
