{ pkgs, ... }: {
  basePackages = with pkgs; [
    binutils
    curl
    dig
    dua
    duf
    file
    htop
    killall
    macchanger
    manix
    unstable.nix-init
    nix-output-monitor
    nmap
    ntfs3g
    pciutils
    # permer
    ripgrep
    rsync
    statix
    traceroute
    trash-cli
    tree
    unzip
    usbutils
    vim
    wget
  ];
}
