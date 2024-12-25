{ pkgs, ... }:
{

  programs.drawio = {
    enable = true;
    package = pkgs.drawio;
    # settings = {
    #   enableSpellCheck = true;
    #   isGoogleFontsEnabled = true;
    # };
    # preferences = {
    #   # Zoom Config
    #   zoomWheel = false;
    #   zoomFactor = 1.3;
    #
    #   # Spell Check
    #   spellcheck = {
    #     dictionaries = [ "en-US" ];
    #   };
    #
    #   # Fonts
    #   defaultFonts = [
    #     "Comic Sans MS"
    #     "Courier New"
    #     "Garamond"
    #     "Georgia"
    #     "Helvetica"
    #     "Iosevka Nerd Font"
    #     "JetBrainsMono Nerd Font"
    #     "Lucida Console"
    #     "Tahoma"
    #     "Times New Roman"
    #     "Verdana"
    #   ];
    #
    #   # Libraries
    #   defaultLibraries = "general;uml;er;bpmn;flowchart;basic;arrows2";
    #   customLibraries = [
    #     "L.scratchpad"
    #   ];
    #
    #   # Auto Save
    #   autosave = true;
    #   autosaveDelay = "60000"; # 1 minute in milliseconds
    #
    #   #Misc
    #   showStartScreen = false;
    #   defaultPageVisible = false;
    #   search = true;
    #
    #   # Contrast & Theme
    #   # highContrast = true;
    #   enableCssDarkMode = true;
    #   ui = "dark";
    #
    # };
  };
}
