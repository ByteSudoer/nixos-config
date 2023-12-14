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
    fzf
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
    statix
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
