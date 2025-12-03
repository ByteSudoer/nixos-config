{
  pkgs,
  desktop,
  ...
}:
{
  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "latte";
      font = "JetBrains Mono";
      fontSize = "9";
      background = "${../../../Wallpapers/gruvbox/gruvbox-dark-rainbow.png}";
      loginBackground = false;
    })
  ];
  services.displayManager = {
    sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      theme = "catppuccin-latte-mauve";
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
