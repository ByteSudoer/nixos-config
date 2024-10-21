{ pkgs, config, ... }:
{
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot-wayland;

    # Configuration to be saved in an INI file
    settings = {
      General = {
        savePath = "${config.home.homeDirectory}/Pictures/screenshots";
        saveAsFileExtension = ".png";
        disabledTrayIcon = false;
        useJpgForClipboard = false;
      };
    };
  };
}
