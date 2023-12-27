{ pkgs, ... }: {
  imports = [
    ./bitwarden.nix
    ./discord.nix
    ./dropbox.nix
    ./ferdium.nix
    ./imagers.nix
    ./obsidian.nix
    ./qbittorent.nix
    ./spotify.nix
    ./utils.nix
  ];

  # home.packages = with pkgs;[
  #   linux-wifi-hotspot
  # ];
}
