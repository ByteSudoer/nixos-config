{
  pkgs,
  colorscheme,
  desktop,
  ...
}:

let
  colorPlugin =
    if colorscheme == "dracula" then
      "dracula"
    else if colorscheme == "gruvbox" then
      "gruvbox"
    else
      "dracula";
  copy-command =
    if desktop == "hyprland" then
      "${pkgs.wl-clipboard}/bin/wl-clipboard"
    else
      "xclip -in -selection clipboard";
in
{

  # Configure Tmux
  programs.tmux = {
    enable = true;
    package = pkgs.tmux;
    #Base index for windows and panes
    baseIndex = 1;
    clock24 = true;
    historyLimit = 100000;
    keyMode = "vi";
    mouse = true;
    #Automatically spawn a session if trying to attach and none are running.
    newSession = true;
    prefix = "C-Space";
    terminal = "screen-256color";
    plugins = with pkgs; [
      {

        plugin = tmuxPlugins.${colorPlugin};
        # extraConfig = ''
        #           set -g @catppuccin_window_right_separator "█ "
        #   set -g @catppuccin_window_number_position "right"
        #   set -g @catppuccin_window_middle_separator " | "
        #
        #   set -g @catppuccin_window_default_fill "none"
        #
        #   set -g @catppuccin_window_current_fill "all"
        #
        #   set -g @catppuccin_status_modules "application session"
        #   set -g @catppuccin_status_left_separator "█"
        #   set -g @catppuccin_status_right_separator "█"
        #
        #   set -g @catppuccin_date_time_text "%Y-%m-%d %H:%M:%S"
        # '';

        extraConfig = ''
          set -g @dracula-plugins "battery cpu-usage ram-usage time"
          set -g @dracula-cpu-usage-label ""
          set -g @dracula-ram-usage-label ""
          set -g @dracula-show-timezone false
          set -g @dracula-day-month true
        '';
        #
      }
      { plugin = tmuxPlugins.sensible; }
      { plugin = tmuxPlugins.copycat; }
    ];
    extraConfig = ''
      set-option -sa terminal-overrides ",$TERM:RGB"

      unbind C-b
      unbind v
      unbind h
      unbind %
      unbind '"'
      unbind r

      unbind n #DEFAULT KEY: Move to next window
      unbind w #DEFAULT KEY: change current window interactively 

      unbind [
      bind Enter copy-mode
       unbind p
      bind p paste-buffer
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel '${copy-command}'

      bind n command-prompt "rename-window '%%'"
      bind w new-window -c "#{pane_current-path}"
      bind -n C-h select-pane -L
      bind -n C-j select-pane -D
      bind -n C-k select-pane -U
      bind -n C-l select-pane -R
    '';
  };

}
