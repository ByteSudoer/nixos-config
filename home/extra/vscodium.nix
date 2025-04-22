{ pkgs, colorscheme, ... }:
let
  ColorScheme = if colorscheme == "dracula" then "Tokyo Night" else "Gruvbox Dark Hard";
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = true;
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

      #Python
      ms-python.python
      ms-python.black-formatter
      charliermarsh.ruff
      #james-yu.latex-workshop

      #Spell Checker
      #streetsidesoftware.code-spell-checker

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

      "workbench" = {
        "colorTheme" = "${ColorScheme}";
        "iconTheme" = "vscode-icons";
        "list" = {
          "smoothScrolling" = true;
        };
      };

      "editor" = {
        "formatOnSave" = true;
        "smoothScrolling" = true;
        "cursorBlinking" = "smooth";
        "cursorSmoothCaretAnnimation" = "on";
      };

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

      #Python & Notebook linting and Formatting
      "[python]" = {
        "editor.formatOnSave" = true;
        "editor.codeActionsOnSave" = {
          "source.fixAll" = "explicit";
          "source.organizeImports" = true;
        };
        "editor.defaultFormatter" = "charliermarsh.ruff";
      };

      "notebook.formatOnSave.enabled" = true;
      "notebook.codeActionsOnSave" = {
        "notebook.source.fixAll" = "explicit";
        "notebook.source.organizeImports" = "explicit";
      };

      # Spell Checker Configuration
      "cSpell.enabled" = true;
      "cSpell.language" = "en,fr";
      "cSpell.diagnosticLevel" = "Information";
      "cSpell.maxNumberOfProblems" = 100;
      "cSpell.numSuggestions" = 8;
      "cSpell.minWordLength" = 4;
      "cSpell.enabledFileTypes" = {
        "bash" = "true";
        "c" = "true";
        "csharp" = "true";
        "go" = "true";
        "javascript" = "true";
        "javascriptreact" = "true";
        "markdown" = "true";
        "php" = "true";
        "plaintext" = "true";
        "python" = "true";
        "rust" = "true";
        "sql" = "true";
        "typescript" = "true";
        "typescriptreact" = "true";
        "yaml" = "true";
      };
      "cSpell.ignorePaths" = [
        "node_modules"
        "**/node_modules"
        "**/node_modules/**"
        "node_modules/**"
        "vscode-extension"
        ".git"
        "*.dll"
        "**/*.dll"
      ];
    };

  };
}
