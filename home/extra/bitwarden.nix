{ pkgs, ... }: {
  home.packages = with pkgs.unstable; [
    bitwarden
  ];
}
