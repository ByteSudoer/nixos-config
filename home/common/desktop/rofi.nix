{pkgs,...}:{
  programs.rofi = {
    enable = true;
  };
  xdg.configFile.rofi = {
    source = ../../../config/rofi;
    recursive = true;
  };
}