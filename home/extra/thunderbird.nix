{ pkgs, username, ... }:
{
  programs.thunderbird = {
    enable = false;
    profiles = {
      # "${username}" = {
      #   name = "ByteSudoer";
      #   accountsOrder = [
      #     "work"
      #     "uni"
      #   ];
      # };
    };
    settings = {
      "privacy.donottrackheader.enabled" = true;
    };

  };
}
