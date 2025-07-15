{
  pkgs,
  colorscheme,
  username,
  font,
  ...
}:

let
  colors =
    if colorscheme == "gruvbox" then
      {
        font_color = "rgba(204, 36, 29, 1)"; # (#cc241d)
        font_color_password = "rgba(215, 153, 33, 1)"; # (#d79921)
        inner_color = "rgba(146, 131, 116, 1)"; # (#928374)
        outer_color = "rgba(40, 40, 40, 1)"; # (#282828)
      }
    else
      {
        font_color = "rgba(255, 255, 255, 1)";
        inner_color = "rgba(50, 50, 50, 1)";
        outer_color = "rgba(0, 0, 0, 1)";
      };
in
{
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 0;
        hide_cursor = false;
        no_fade_in = true;
        no_fade_out = true;
      };

      background = {
        path = "/home/${username}/nixos-config/Wallpapers/${colorscheme}/gruv_linux.png";
        blur_passes = 0;
        # contrast = 1;
        # brightness = 1;
        # vibrancy = 0.2;
        # vibrancy_darkness = 0.2;
      };

      input-field = {
        size = "300, 70";
        monitor = "";
        dots_size = 0.2;
        dots_spacing = 0.35;
        dots_center = true;
        fade_on_empty = false;
        font_color = colors.font_color_password;
        inherit (colors) inner_color;
        inherit (colors) outer_color;
        outline_thickness = 2;
        placeholder_text = "Input Password ....";
        position = "0, -300";
        halign = "center";
        valign = "center";
      };

      label = [
        # Date
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +'%A, %B %d')"'';
          color = colors.font_color_password;
          font_size = 22;
          font_family = "${font}";
          position = "0, 300";
          halign = "center";
          valign = "center";
        }
        # Time
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +'%H:%M')"'';
          color = colors.font_color_password;
          font_size = 95;
          font_family = "JetBrains Mono Extrabold";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
        # Current Song
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(playerctl metadata --format '{{artist}} - {{title}}')"'';
          color = colors.font_color;
          font_size = 18;
          font_family = "Metropolis Light, Font Awesome 6 Free Solid";
          position = "0, 50";
          halign = "center";
          valign = "bottom";
        }
      ];

      image = [
        # Profile Picture
        # {
        #   monitor = "";
        #   path = "/home/${username}/nixos-config/Wallpapers/dracula/tux.png";
        #   size = 100;
        #   border_size = 2;
        #   border_color = colors.outer_color;
        #   position = "0, -100";
        #   halign = "center";
        #   valign = "center";
        # }
        # Desktop Environment Logo
        # {
        #   monitor = "";
        #   path = "/home/${username}/nixos-config/Wallpapers/dracula/tux.png";
        #   size = 75;
        #   border_size = 2;
        #   border_color = colors.outer_color;
        #   position = "-50, 50";
        #   halign = "right";
        #   valign = "bottom";
        # }
      ];
    };
  };
}
