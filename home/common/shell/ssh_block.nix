{ config, username, ... }:
{
  programs = {
    ssh = {
      enable = true;
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
        "pi" = {
          hostname = "192.168.100.29";
          user = username;
          identityFile = "${config.home.homeDirectory}/.ssh/raspberry_pi";
        };
        "ubuntu" = {
          hostname = "192.168.122.10";
          user = "ubuntu";
        };
        "shuffle" = {
          hostname = "192.168.13.110";
          user = "ubuntu";
          identityFile = "${config.home.homeDirectory}/.ssh/ubuntu-vm";
        };
        "attacker-ubuntu" = {
          hostname = "192.168.13.20";
          user = "ubuntu";
          identityFile = "${config.home.homeDirectory}/.ssh/ubuntu-vm";
        };
        "kali" = {
          hostname = "192.168.122.20";
          user = "kali";
        };

      };
    };
  };
}
