{ pkgs, ... }:
{

  # Configure Git
  programs.git = {
    package = pkgs.gitFull;
    enable = true;
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
      "*.log"
      "*.out"
      "dist/"
      "result"
    ];

    settings = {
      user = {
        name = "ByteSudoer";
        email = "ByteSudoer@users.noreply.github.com";
      };

      extraConfig = {
        core = {
          pager = "bat";
        };
        init = {
          defaultBranch = "main";
        };
      };

      aliases = {
        addall = "add --all";
        cm = "commit -m";
        cmm = "commit --amend --no-edit";
        ll = "log --oneline";
        st = "status -sb";
        graph = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      };

    };

  };

  programs.difftastic = {
    enable = true;
    options = {
      display = "side-by-side-show-both";
    };
  };

}
