{ pkgs, ... }:
{
  home.packages = with pkgs; [
    acpilight
    acpi
    arandr
    arion

    bc # Terminal calculator

    dconf2nix # Nix code from Dconf files

    networkmanagerapplet
    numlockx # handle Numlock operations
    hyperfine # Terminal benchmarking
    speedtest-go # Terminal speedtest.net

    ## Internet Downloader
    motrix
  ];
}
