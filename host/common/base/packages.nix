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
    gnumake
    htop
    jq
    killall
    ntfs3g
    pciutils
    # permer
    ripgrep
    rsync
    traceroute
    trash-cli
    tree
    unzip
    usbutils
    vim
    wget

    #TODO to be removed
    vscodium
  ];
}
