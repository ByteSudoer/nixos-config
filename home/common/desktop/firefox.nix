{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-GB" "fr" ];
    package = pkgs.unstable.firefox;
  };
}
