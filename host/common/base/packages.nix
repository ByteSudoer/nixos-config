{ pkgs, ... }: {
  basePackages = with pkgs; [
    bat
    binutils
    curl
    dig
    dua
    duf
    unstable.eza
    fd
    file
    git
    github-cli
    htop
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

    #TODO to be removed
    vscodium
  ];
}
