_: {
  programs.command-not-found.enable = false;
  programs.nix-index = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyIgnore = [
      "ls"
      "cd"
      "exit"
      "shutdown"
      "reboot"
      "clear"
    ];
    bashrcExtra = ''
      HISTTIMEFORMAT="%F %T  "
      export HISCONTROL=ignoreboth:erasedups

      set -o vi
      force_color_prompt=yes
      color_prompt=yes
      bind "set completion-ignore-case on"
      batdiff() {
        git diff --name-only --relative --diff-filter=d | xargs bat --diff
      }
    '';

    initExtra = ''
      nerdfetch

    '';
    shellAliases = {
      # Better Format with exa
      ls = "eza -al --color=always --git --icons --group-directories-first";
      la = "eza -a --color=always  --git --icons --group-directories-first";
      ll = "eza -l --color=always  --git --icons --group-directories-first";
      lt = "eza -aT --color=always --git --icons --group-directories-first";
      cp = "cp -i -v";
      mv = "mv -i -v";
      mkdir = "mkdir -p";
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";
      del = "trash -v";

      chmox = "chmod +x";
      reloadbash = "source $HOME/.bashrc";
      psa = "ps auxf";
      psgrep = "ps aux | grep -v grep | grep -i -e VSZ -e";
      df = "df -h";
      free = "free -mt";
      wget = "wget -c";
      userlist = "cut -d: -f1 /etc/passwd";
      pdf = "zathura";
      cat = "bat --theme=Dracula";
      oldcat = "cat";
      configs = "cd $HOME/nixos-config";
      nixpkgs-repo = "cd $HOME/AllDev/Nix/nixpkgs";
      dotfiles = "cd $HOME/.config/Dotfiles";
      tmuxattach = "tmux attach-session -t";
      tmuxnew = "tmux new -s";
      tmux = "tmux -2";
      tmuxKillAll = "tmux kill-server";
      t = "tmux_session";
      doc = "rustup doc";
      his = "history | cut -c 29- | sort -u | fzf | sh -";
      update = "sudo nix-chanel --update";
      copy = "xclip -selection clipboard";
      v = "nvim -p";
      ssha = "eval $(ssh-agent)";

    };
    shellOptions = [
      "autocd"
      "cdspell"
      "cmdhist"
      "dotglob"
      "histappend"
      "expand_aliases"
    ];

  };
}
