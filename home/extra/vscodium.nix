{
  pkgs,
  config,
  colorscheme,
  username,
  ...
}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [

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
  };

  # User Settings file
  home.file.".config/VSCodium/User/settings.json".source = (
    config.lib.file.mkOutOfStoreSymlink "/home/${username}/nixos-config/config/codium/settings.json"
  );
}
