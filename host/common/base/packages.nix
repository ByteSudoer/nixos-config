{ pkgs, ... }: {
  basePackages = with pkgs; [
    agenix
    bat
    binutils
    curl
    dua
    duf
    unstable.eza
    fd
    file
    git
    htop
    jq
    killall
    ntfs3g
    pciutils
    ripgrep
    traceroute
    tree
    unzip
    usbutils
    vim
    wget
  ];
}
