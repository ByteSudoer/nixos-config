{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  # Get the Needed fonts
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    (nerdfonts.override
      {
        fonts = [ "JetBrainsMono" "SourceCodePro" "FiraCode" "Iosevka" "ComicShannsMono" ];
      })
    # dejavu_fonts
    comic-mono
    # source-code-pro
    jetbrains-mono
    # fira-code-symbols
    # ibm-plex
    # iosevka
  ];

}
