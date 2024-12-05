{
  pkgs,
  lib,
  desktop,
  ...
}:
{
  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      font = "Noto Sans";
      fontSize = "9";
      background = "${../../../Wallpapers/dracula/tux.png}";
      loginBackground = true;
    })
  ];
  services.displayManager = {

    sddm = {
      enable = true;
      package = lib.mkForce pkgs.kdePackages.sddm;
      theme = "catppuccin-mocha";
      autoNumlock = true;
      enableHidpi = true;
      settings = {
        General = {
          InputMethod = "";
        };
      };
      wayland =
        if desktop == "hyprland" then
          {
            enable = true;
            compositor = "weston";
          }
        else
          { };
    };
  };
  services.xserver = {
    enable = true;
    xkb = {
      layout = "fr";
      variant = "azerty";
    };
  };
}
