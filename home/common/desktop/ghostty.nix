{
  pkgs,
  colorscheme,
  font,
  ...
}:
let
  theme =
    if colorscheme == "Dracula" then
      "dracula"
    else if colorscheme == "gruvbox" then
      "GruvBox Dark"
    else
      "TokyoNight Storm";
in
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;

    # Shell integration
    shellIntegration = {
      enable = true;
      enableBashIntegration = true;
    };

    # Global Settings
    settings = {
      font-family = "${font}";
      font-size = "11";

      #Appearance
      theme = "${theme}";
    };
  };
}
