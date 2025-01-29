{ pkgs, ... }:
{
  programs.lazygit = {
    enable = true;
    package = pkgs.lazygit;
    settings = {
      git = {
        paging = {
          colorOrg = "always";
          useConfig = false;
        };

      };

    };
  };
}
