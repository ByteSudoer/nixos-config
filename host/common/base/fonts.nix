_: {

  fonts = {
    # Enable a basic set of fonts providing several font styles and families and reasonable coverage of Unicode.
    enableDefaultPackages = true;
    fontDir.enable = true;
    # packages = with pkgs; [
    #   (nerdfonts.override { fonts = [ "FiraCode" "SourceCodePro" "UbuntuMono" ]; })
    #   fira
    #   fira-go
    # ];

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
