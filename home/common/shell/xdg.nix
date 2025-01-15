{ config, lib, ... }:
{
  xdg = {
    enable = true;

    configHome = config.home.homeDirectory + "/.config";
    cacheHome = config.home.homeDirectory + "/.local/cache";
    dataHome = config.home.homeDirectory + "/.local/share";
    stateHome = config.home.homeDirectory + "/.local/state";

    userDirs = {
      enable = true;
      createDirectories = lib.mkDefault true;
      download = config.home.homeDirectory + "/Downloads";
      pictures = config.home.homeDirectory + "/Pictures";
      desktop = config.home.homeDirectory;
      documents = config.home.homeDirectory + "/Documents";
      music = config.home.homeDirectory + "/Music";
      publicShare = config.home.homeDirectory + "/Public";
      templates = config.home.homeDirectory + "/Templates";
      videos = config.home.homeDirectory + "/Videos";

      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/Pictures/Screenshots";
      };
    };

    mimeApps = {
      enable = false;
      defaultApplications = {
        "text/html" = "firefox.desktop";
      };

    };
  };
}
