{ pkgs, ... }:
{
  home.packages = with pkgs; [
    acpilight
    acpi
    arandr
    arion

    bc

    networkmanagerapplet
    numlockx

  ];
}
