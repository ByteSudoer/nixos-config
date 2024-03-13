{ config, ... }:
{
  systemd.user.sessionVariables = rec {

    TERM = "alacritty";
    EDITOR = "nvim";
    VISUAL = "nvim";
    MANPAGER = "nvim +Man!";
    # TERM = "screen-256color";
    HISCONTROL = "ignoreboth:erasedups";
    XDG_CONFIG_HOME = config.home.homeDirectory + "/.config";
    XDG_DATA_HOME = config.home.homeDirectory + "/.local/share";
    XDG_STATE_HOME = config.home.homeDirectory + "/.local/state";
    XDG_BIN_HOME = config.home.homeDirectory + "/.local/bin";
    NIXOS_CONFIG_DIR = config.home.homeDirectory + "/nixos-config";
  };

}
