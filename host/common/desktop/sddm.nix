{pkgs,lib,...}:
{
  services.xserver = {
    enable = true;
    displayManager = {
      # defaultSession = "none+awesome";
      sddm = {
        enable = true;
        theme =
          "${import ../../../pkgs/sddm-themes/sddm-astronaut.nix { inherit pkgs; }}";
        autoNumlock = true;
        enableHidpi = true;
      };
    };
    layout = "fr";
    xkbVariant = "azerty";
  };
}