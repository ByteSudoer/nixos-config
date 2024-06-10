{ pkgs, colorscheme, ... }:
{
  services.displayManager = {

    sddm = {
      enable = true;
      theme =
        "${import ../../../pkgs/sddm-themes/sddm-${colorscheme}.nix { inherit pkgs; }}";
      autoNumlock = true;
      enableHidpi = true;
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
