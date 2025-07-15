{ pkgs, ... }:
{
  basePackages = with pkgs; [
    binutils
    cryptsetup
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
    unrar
    unzip
    usbutils
    vim
    wget
    zip
  ];
}
