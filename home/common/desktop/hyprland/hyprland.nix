{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    # enableNvidiaPatches = true;
    #https://nix-community.github.io/home-manager/options.xhtml#opt-wayland.windowManager.hyprland.systemd.enable
    systemd.enable = true;
    settings = {

      exec-once = [
        "waybar"
        "copyq --start-server"
      ];
      "$mod" = "SUPER";
      input = {
        kb_layout = "fr";
      };
      # KeyBorad Bindings
      bind = [
        "$mod,return,exec,alacritty"
        "$mod,w,exec,firefox"
        "$mod SHIFT,q,killactive"
      ];
      # Window Rules
      windowrule = [
        "float,^(pavucontrol)$"
      ];
    };



  };
}
