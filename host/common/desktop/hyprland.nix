{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;

  };
  # For Screen Sharing
  services.dbus.enable = true;
  # xdg.portal = {
  #   enable = true;
  #   wlr.enable = true;
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # };
  environment.systemPackages = with pkgs; [
    kdePackages.ark
    evince
    wlprop
  ];

  ## Needed for swaylock
  # security.pam.services.swaylock = { };

  ## Needed for Hyprlock
  security.pam.services.hyprlock = { };

}
