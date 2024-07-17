{ pkgs, ... }:
{
  programs.fd = {
    enable = true;
    package = pkgs.fd;
    ignores = [
      ".git/"
      "*.bak"
    ];
    extraOptions = [
      "--absolute-path"
      "--colors=always"
    ];
  };
}
