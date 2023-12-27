{ pkgs, ... }: {
  imports = [
    ./bitwarden.nix
    ./discord.nix
    ./dropbox.nix
    ./ferdium.nix
    ./imagers.nix
    ./libreoffice.nix
    ./obsidian.nix
    ./qbittorrent.nix
    ./spotify.nix
    ./utils.nix
  ];

  # home.packages = with pkgs;[
  #   linux-wifi-hotspot
  # ];
}
