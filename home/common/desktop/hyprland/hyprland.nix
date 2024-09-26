{ pkgs, colorscheme, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    # enableNvidiaPatches = true;
    #https://nix-community.github.io/home-manager/options.xhtml#opt-wayland.windowManager.hyprland.systemd.enable
    # systemd.enable = true;
    settings = {

      "$mod" = "SUPER";
      monitor = "eDP-1, 1920x1200, auto, 1.0";
      general = {
        border_size = 1;
        gaps_in = 2;
        gaps_out = 10;
      };

      input = {
        kb_layout = "fr";
        numlock_by_default = true;
      };
      exec-once = [
        "waybar"
        "lxqt-policykit-agent"
        "swww init"
        "swww_randomize $HOME/nixos-config/Wallpapers/${colorscheme}"
        "discord --start-minimized"
        "ferdium"
        "dropbox"
        "xwaylandvideobridge"
        "copyq --start-server"
      ];

      # KeyBorad Bindings
      bind = [
        "$mod,return,exec,alacritty"
        "$mod,w,exec,firefox"
        "$mod SHIFT,return,exec,thunar"
        "$mod SHIFT,q,killactive"
        "$mod,code:94,exec,${pkgs.bash}/bin/bash $HOME/.config/rofi/launchers/type-4/launcher.sh"
        "$mod,v,exec,pavucontrol"

        # Resize windows
        "ALT SHIFT,l,resizeactive,10 -10"
        "ALT SHIFT,h,resizeactive,-10 10"

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

        #Toggle between windows
        "ALT,Tab,exec,rofi_window"

        #Hyprctl keymaps
        "$mod SHIFT,r,exec,hyprctl reload"

        #Brightness and Audio Controls
        ",XF86MonBrightnessUp,exec,brightnessctl set 10%+"
        ",XF86MonBrightnessDown,exec,brightnessctl set 10%-"
        ",XF86AudioRaiseVolume,exec,amixer sset Master 10%+"
        ",XF86AudioLowerVolume,exec,amixer sset Master 10%-"
        ",XF86AudioMute,exec,amixer sset Master toggle"

        #ScreenShot
        ",Print,exec,grimblast --notify copy area"
        "SHIFT,Print,exec,grimblast --notify save area"
        "$mod SHIFT,Print,exec,grimblast --notify save output"

        #Lock Screen
        ",F12,exec,lock"

        #General Dispatechers
        "$mod,f,exec,hyprctl dispatch togglefloating"
        "$mod,m,exec,hyprctl dispatch fullscreen 1"
        # "$mod,1,exec,hyprctl dispatch movetoworkspace 1"
        "$mod SHIFT,code:10,exec,hyprctl dispatch movetoworkspace 1"
        "$mod SHIFT,code:11,exec,hyprctl dispatch movetoworkspace 2"
        "$mod SHIFT,code:12,exec,hyprctl dispatch movetoworkspace 3"
        "$mod SHIFT,code:13,exec,hyprctl dispatch movetoworkspace 4"
        "$mod SHIFT,code:14,exec,hyprctl dispatch movetoworkspace 5"
        "$mod SHIFT,code:15,exec,hyprctl dispatch movetoworkspace 6"

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
        "float,title:^(Authentication Required)$"
      ];

      windowrulev2 = [
        "float,class:(lxqt-policykit-agent)"
        "float,class:(xfce4-taskmanager)"
        "float,class:(thunar)"
        "float,class:(wihotspot-gui)"
        "float,title:(Bluetooth)"
        "float,title:(Picture-in-Picture)"

        ## Opacity Rules
        "opacity 0.8 0.8,class:^(Alacritty)$"
        "opacity 0.8 0.8,class:^(firefox)$"
        "opacity 0.8 0.8,class:^(thunar)$"
        "opacity 0.8 0.8,class:^(Spotify)$"
        "opacity 0.8 0.8,class:^(discord)$"

        ## Workspace & Window Rules
        "workspace 3,class:^(VirtualBox Manager)$"
        "workspace 3,class:^(virt-manager)$"
        "workspace 4,class:^(Spotify)$"
        "workspace 5,class:^(discord)$"
        "workspace 5,class:^(Ferdium)$"

        #xwaylandvideobridge Rules
        "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"

        "size 800 450, title:(Picture-in-Picture)"
        "pin, title:^(Picture-in-Picture)$"
        "float, title:^(Firefox)$"
        "size 800 450, title:(Firefox)"
        " pin, title:^(Firefox)$"

      ];

      ## Environment Variables
      env = [
        "QT_QPA_PLATFORM,wayland;xcb"
        # "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        # XDG Specifications
        "XDG_CURRENT_DESKTOP,Sway"
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
