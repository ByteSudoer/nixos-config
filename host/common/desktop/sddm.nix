{ pkgs, colorscheme, ... }:
{
  services.xserver = {
    enable = true;
    displayManager = {
      # defaultSession = "none+awesome";
      sddm = {
        enable = true;
        theme =
          "${import ../../../pkgs/sddm-themes/sddm-${colorscheme}.nix { inherit pkgs; }}";
        autoNumlock = true;
        enableHidpi = true;
      };
    };
    layout = "fr";
    xkbVariant = "azerty";
  };
}
