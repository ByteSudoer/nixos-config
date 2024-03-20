{ ... }: {
  imports = [
    ./bitwarden.nix
    ./chromium.nix
    ./discord.nix
    ./distrobox.nix
    ./drawio.nix
    ./dropbox.nix
    ./ferdium.nix
    ./imagers.nix
    ./insomnia.nix
    ./intellij.nix
    ./libreoffice.nix
    ./obsidian.nix
    ./qbittorrent.nix
    ./spotify.nix
    ./utils.nix
    ./vscodium.nix
  ];

  # home.packages = with pkgs;[
  #   linux-wifi-hotspot
  # ];
}
