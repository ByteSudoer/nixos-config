{ pkgs, colorscheme, ... }:
let
  ColorScheme = if colorscheme == "dracula" then "Tokyo Night" else "Gruvbox Dark Hard";
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [

      #Nix support
      bbenoist.nix
      jnoortheen.nix-ide
      hashicorp.terraform

      #Vim KeyBinding
      vscodevim.vim

      #CSV colors
      mechatroner.rainbow-csv

      #ColorScheme
      enkia.tokyo-night
      jdinhlife.gruvbox

      #Icons
      vscode-icons-team.vscode-icons

      # Github Actions
      github.vscode-github-actions

    ];
    userSettings = {
      "files.autoSave" = "onFocusChange";
      "[nix]"."editor.tabSize" = 2;
      "telemetry.telemetryLevel" = "off";
      "redhat.telemetry.enabled" = false;
      "workbench.colorTheme" = "${ColorScheme}";
      "editor.formatOnSave" = true;
      "workbench.iconTheme" = "vscode-icons";

      #Terraform Formatting
      "[terraform]" = {
        "editor.defaultFormatter" = "hashicorp.terraform";
        "editor.formatOnSave" = false;
        "editor.codeActionsOnSave" = {
          "source.formatAll.terraform" = true;
        };
      };
      "[terraform-vars]" = {
        "editor.defaultFormatter" = "hashicorp.terraform";
        "editor.formatOnSave" = false;
        "editor.codeActionsOnSave" = {
          "source.formatAll.terraform" = true;
        };
      };
      "terraform" = {
        "experimentalFeatures.prefillRequiredFields" = true;
        "experimentalFeatures.validateOnSave" = true;
        "editor.suggest.preview" = true;
      };
    };

  };
}
