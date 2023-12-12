{ pkgs, ... }: {
  basePackages = with pkgs; [
    bat
    binutils
    curl
    dua
    duf
    unstable.eza
    fd
    file
    git
    jq
    killall
    ntfs3g
    pciutils
    ripgrep
    rsync
    traceroute
    tree
    unzip
    usbutils
    vim
    wget
  ];
}
