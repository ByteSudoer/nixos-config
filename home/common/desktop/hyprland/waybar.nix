{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        modules-left = [ "hyprland/workspaces" ];
        "hyprland/workspaces" = {
          all-outputs = true;
          format = "{name}: {icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            active = "";
            default = "";
          };
          persistent-workspaces = {
            "*" = 5;
          };
        };
      };
    };
    style = ''
      * {
         border: none;
         border-radius: 0;
         font-family: Source Code Pro;
       }
       window#waybar {
         background: #16191C;
         color: #AAB2BF;
       }
       #workspaces button {
         padding: 0 5px;
       }

    '';

  };
}
