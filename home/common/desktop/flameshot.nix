{ pkgs, config, ... }:
{
  services.flameshot = {
    enable = true;
    # package = pkgs.flameshot-wayland;
    package = pkgs.flameshot;

    # Configuration to be saved in an INI file
    settings = {
      General = {
        savePath = "${config.home.homeDirectory}/Pictures/Screenshots";
        startupLaunch = true;
        showDesktopNotification = true;
        saveAsFileExtension = ".png";
        disabledTrayIcon = false;
        useJpgForClipboard = false;
      };
    };
  };
}
