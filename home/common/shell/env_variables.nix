_:
{
  systemd.user.sessionVariables = rec {

    EDITOR = "nvim";
    VISUAL = "nvim";
    MANPAGER = "nvim +Man!";
    TERM = "screen-256color";
    HISCONTROL = "ignoreboth:erasedups";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_BIN_HOME = "$HOME/.local/bin";
    NIXOS_CONFIG_DIR = "$HOME/nixos-config";
  };

}
