{ pkgs, ... }:
{

  # Configure Git
  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "ByteSudoer";
    userEmail = "ByteSudoer@users.noreply.github.com";
    # Replaces ~/.gitignore
    ignores = [
      ".cache/"
      ".DS_Store"
      ".idea/"
      "*.swp"
      "built-in-stubs.jar"
      "dumb.rdb"
      ".elixir_ls/"
      ".vscode/"
      "npm-debug.log"
    ];

    aliases = {
      addall = "add --all";
      cm = "commit -m";
      cmm = "commit --amend --no-edit";
      ll = "log --oneline";
      st = "status -sb";
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };

  };

}
