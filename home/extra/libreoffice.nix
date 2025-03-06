{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.fr-moderne

    #Edit pdf files
    pdfarranger
  ];

  programs.okular = {
    enable = true;
    general = {
      mouseMode = "TextSelect";
      openFileInTabs = true;
      showScrollbars = true;
      smoothScrolling = true;
      viewContinuous = true;
      viewMode = "Facing";
      zoomMode = "fitWidth";
    };
  };
}
