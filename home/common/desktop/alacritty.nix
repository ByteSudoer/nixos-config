{ pkgs, ... }:
let
  font = "JetBrains Mono";
in
{
  #Configure Alacritty
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    settings = {
      cursor = {
        style = "Block";
        vi_mode_style = "Beam";
        unfocused_hollow = true;
        thickness = 0.15;
      };
      env = {
        TERM = "xterm-256color";
        IS_ALACRITTY = "true";
      };
      scrolling = {
        history = 100000;
        multiplier = 3;
      };
      selection = {
        semantic_escape_chars = '',│`|:"' ()[]{}<>	'';
        save_to_clipboard = true;
      };
      font = {
        size = 9;
        normal = {
          family = "${font}";
          style = "
            Regular ";
        };
        bold = {
          family = " ${font}";
          style = "Bold";
        };
        italic = {
          family = "${font}";
          style = "
            Italic ";
        };
        bold_italic = {
          family = "${font}";
          style = "Bold Italic";
        };
      };
      colors = {

        # #### Gruvbox
        # primary = {
        #   background = "0x1d2021";
        #   foreground = "0xd4be98";
        # };
        #
        # normal = {
        #   black = "0x32302f";
        #   red = "0xea6962";
        #   green = "0xa9b665";
        #   yellow = "0xd8a657";
        #   blue = "0x7daea3";
        #   magenta = "0xd3869b";
        #   cyan = "0x89b482";
        #   white = "0xd4be98";
        # };
        # bright = {
        #   black = "0x32302f";
        #   red = "0xea6962";
        #   green = "0xa9b665";
        #   yellow = "0xd8a657";
        #   blue = "0x7daea3";
        #   magenta = "0xd3869b";
        #   cyan = "0x89b482";
        #   white = "0xd4be98";
        # };
        #### Dracula
        primary = {
          background = "0x282a36";
          foreground = "0xf8f8f2";
        };
        normal = {
          black = "0x000000";
          red = "0xff5555";
          green = "0x50fa7b";
          yellow = "0xf1fa8c";
          blue = "0xcaa9fa";
          magenta = "0xff79c6";
          cyan = "0x8be9fd";
          white = "0xbfbfbf";
        };
        bright = {
          black = "0x575b70";
          red = "0xff6e67";
          green = "0x5af78e";
          yellow = "0xf4f99d";
          blue = "0xcaa9fa";
          magenta = "0xff92d0";
          cyan = "0x9aedfe";
          white = "0xe6e6e6";
        };

      };
    };
  };
}
