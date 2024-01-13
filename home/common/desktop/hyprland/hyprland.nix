{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    # enableNvidiaPatches = true;
    #https://nix-community.github.io/home-manager/options.xhtml#opt-wayland.windowManager.hyprland.systemd.enable
    # systemd.enable = true;
    settings = {

      "$mod" = "SUPER";

      input = {
        kb_layout = "fr";
        numlock_by_default = true;


      };
      exec-once = [
        "waybar"
        "lxqt-policykit-agent"
        "copyq --start-server"
        "swww init"
        "swww_randomize $HOME/nixos-config/Wallpapers"
      ];
      # KeyBorad Bindings
      bind = [
        "$mod,return,exec,alacritty"
        "$mod,w,exec,firefox"
        "$mod SHIFT,return,exec,thunar"
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

        ## Switch between workspaces
        "ALT,l,workspace,+1"
        "ALT,h,workspace,-1"

        #Hyprctl keymaps
        "$mod SHIFT,r,exec,hyprctl reload"

        #Brightness and Audio Controls
        ",XF86MonBrightnessUp,exec,brightnessctl set 10%+"
        ",XF86MonBrightnessDown,exec,brightnessctl set 10%-"
        ",XF86AudioRaiseVolume,exec,amixer sset Master 10%+"
        ",XF86AudioLowerVolume,exec,amixer sset Master 10%-"
        ",XF86AudioMute,exec,amixer sset Master toggle"
      ];

      ## Mouse Bindings
      bindm = [
        "$mod,mouse:272,movewindow"
        "$mod,mouse:273,resizewindow"
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
        "center,^(xfce4-taskmanager)$"
      ];
      windowrulev2 = [
        "float,class:(lxqt-policykit-agent)"

      ];
    };



  };
}
