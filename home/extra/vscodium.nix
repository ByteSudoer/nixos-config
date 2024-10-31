{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [

      #Nix support
      bbenoist.nix
      jnoortheen.nix-ide

      #Vim KeyBinding
      vscodevim.vim

      #CSV colors
      mechatroner.rainbow-csv

      #ColorScheme
      enkia.tokyo-night
      jdinhlife.gruvbox

      #Icons
      vscode-icons-team.vscode-icons

    ];
    userSettings = {
      "files.autoSave" = "onFocusChange";
      "[nix]"."editor.tabSize" = 2;
      "telemetry.telemetryLevel" = "off";
      "redhat.telemetry.enabled" = false;
      "workbench.colorTheme" = "Tokyo Night";
      "editor.formatOnSave" = true;
    };

  };
}
