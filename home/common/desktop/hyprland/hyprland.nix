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
      exec-once = [
        "waybar"
        "copyq --start-server"
        "swww init"
        "swww_randomize $HOME/nixos-config/Wallpapers"
      ];
      # KeyBorad Bindings
      bind = [
        "$mod,return,exec,alacritty"
        "$mod,w,exec,firefox"
        "$mod SHIFT,q,killactive"
        "$mod,code:94,exec,${pkgs.bash}/bin/bash $HOME/.config/rofi/launchers/type-4/launcher.sh"

        ## Change focus
        "$mod,l,movefocus,r"
        "$mod,h,movefocus,l"
        "$mod,k,movefocus,u"
        "$mod,j,movefocus,d"

        ## Move Window
        "$mod SHIFT,l,movewindow,r"
        "$mod SHIFT,h,movewindow,l"
        "$mod SHIFT,k,movewindow,u"
        "$mod SHIFT,j,movewindow,d"
      ];

      ## Misc
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        enable_swallow = true;

      };

      # Window Rules
      windowrule = [
        "float,^(pavucontrol)$"
      ];
    };



  };
}
