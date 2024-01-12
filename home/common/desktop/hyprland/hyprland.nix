{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    # enableNvidiaPatches = true;
    #https://nix-community.github.io/home-manager/options.xhtml#opt-wayland.windowManager.hyprland.systemd.enable
    systemd.enable = true;
    settings = {
      "$mod" = "SUPER";
      input = {
        kb_layout = "fr";
      };
      # KeyBorad Bindings
      bind = [
        "$mod,return,exec,alacritty"
        "$mod,w,exec,firefox"
      ];
      # Window Rules
      windowrule = [
        "float,^(pavucontrol)$"

      ];
    };



  };
}
