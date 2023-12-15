_: {

  fonts = {
    fontconfig = {
      antialias = true;
      # defaultFonts = {
      #   serif = [ "Source Serif" ];
      #   sansSerif = [ "Work Sans" "Fira Sans" "FiraGO" ];
      #   monospace = [ "FiraCode Nerd Font Mono" "SauceCodePro Nerd Font Mono" ];
      #   emoji = [ "Joypixels" "Noto Color Emoji" ];
      # };
      enable = true;
      hinting = {
        autohint = false;
        enable = true;
        style = "slight";
      };
      subpixel = {
        rgba = "rgb";
        lcdfilter = "light";
      };
    };
  };
}
