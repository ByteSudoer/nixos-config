{ pkgs, ... }:
{
  programs.gh = {
    enable = true;
    package = pkgs.gh;
    extensions = with pkgs;[
      gh-eco
      gh-graph
    ];
  };
}
