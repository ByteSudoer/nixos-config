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
        "discord --start-minimized"
        "ferdium"
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
      ];
      windowrulev2 = [
        "float,class:(lxqt-policykit-agent)"
        "float,class:(xfce4-taskmanager)"
        "float,title:(Bluetooth)"
        "float,title:(Picture-in-Picture)"


        ## Opacity Rules
        "opacity 0.8 0.8,class:^(Alacritty)$"
        "opacity 0.8 0.8,class:^(firefox)$"
        "opacity 0.8 0.8,class:^(thunar)$"

      ];

      ## Environment Variables
      env = [
        "QT_QPA_PLATFORM,wayland"
        # "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        # XDG Specifications
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];

      ## Decoration
      decoration = {
        rounding = 5;

        blur = {
          enabled = true;
          size = 3;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
        };

      };
    };



  };
}
