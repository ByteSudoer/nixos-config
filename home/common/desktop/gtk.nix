{ pkgs,colorscheme, ... }:
{

  gtk = {
    enable = true;

    # Dracula Config
    cursorTheme.package = pkgs.dracula-theme;
    cursorTheme.name = "Dracula";
    theme.package = pkgs.dracula-theme;
    theme.name = "Dracula";
    iconTheme.package = pkgs.dracula-icon-theme;
    iconTheme.name = "Dracula";

    #Gruvbox config
    # cursorTheme.package = pkgs.capitaine-cursors-themed;
    # cursorTheme.name = "Capitaine Cursors (Gruvbox)";
    #
    # theme.package = pkgs.gruvbox-gtk-theme;
    # theme.name = "Gruvbox-Dark-B";
    #
    # iconTheme.package = pkgs.gruvbox-dark-icons-gtk;
    # iconTheme.name = "oomox-gruvbox-dark";
  };
}
