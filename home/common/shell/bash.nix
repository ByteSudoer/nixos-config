{ desktop, pkgs, ... }:
let
  copy_command =
    if desktop == "hyprland" then "${pkgs.wl-clipboard}/bin/wl-copy" else "xclip -selection clipboard";
in
{
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

      # Function for shutdown
      shutdown() {
        echo -e "\033[31mAre you sure you want to shut down? (yes/no)\033[0m"
        read answer
        if [ "$answer" = "yes" ]; then
          /run/current-system/sw/bin/shutdown "$@"
        else
          echo "Shutdown canceled."
        fi
      }

      # Function for reboot
      reboot() {
        echo -e "\033[31mAre you sure you want to reboot? (yes/no)\033[0m"
        read answer
        if [ "$answer" = "yes" ]; then
          /run/current-system/sw/bin/reboot "$@"
        else
          echo "Reboot canceled."
        fi
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
      lr = "eza -alR --color=always --git --icons --group-directories-first";
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
      cat = "bat";
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
      copy = copy_command;
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
