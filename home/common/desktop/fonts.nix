{ pkgs, ... }:
{
  # Get the Needed fonts
  home.packages = with pkgs; [
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
