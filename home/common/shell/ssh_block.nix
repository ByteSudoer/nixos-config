{ config, username, ... }:
{
  programs = {
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "github.com" = {
          hostname = "github.com";
          user = "git";
          identityFile = "${config.home.homeDirectory}/.ssh/github_key";
        };
        "github.com-uni" = {
          hostname = "github.com";
          user = "git";
          identityFile = "${config.home.homeDirectory}/.ssh/github_uni";
        };
        "raspberry" = {
          hostname = "raspberrypi";
          user = username;
          identityFile = "${config.home.homeDirectory}/.ssh/raspberry_pi";
        };
      };
    };
  };
}
