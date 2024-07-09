{ pkgs, ... }: {
  basePackages = with pkgs; [
    binutils
    curl
    dig
    dua
    duf
    unstable.eza
    fd
    file
    fzf
    github-cli
    htop
    jq
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
