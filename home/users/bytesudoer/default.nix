{ pkgs, ... }:
{
  home = {
    file.".ssh/config".text = "
      Host github.com
        User git
        Hostname github.com
        IdentityFile ~/.ssh/github_key
      Host github.com-uni
        User git
        Hostname github.com
        IdentityFile ~/.ssh/github_uni
      Host pi
        User bytesudoer
        Hostname 192.168.100.29
        IdentityFile ~/.ssh/raspberry_pi
      Host ubuntu
        User ubuntu
        Hostname 192.168.122.10
    ";
    file.".face".source = ../../../Wallpapers/dracula/tux.png;
    packages = with pkgs; [
      age
      sops
      ssh-to-age
    ];
  };
}
