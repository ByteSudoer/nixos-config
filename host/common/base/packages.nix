{ pkgs, ... }:
{
  basePackages = with pkgs; [
    binutils
    curl
    dig
    dua
    duf
    file
    htop
    killall
    manix
    nix-output-monitor
    nmap
    ntfs3g
    pciutils
    # permer
    rsync
    statix
    traceroute
    trash-cli
    tree
    unzip
    usbutils
    vim
    wget
    zip
  ];
}
