{ pkgs, ... }:
{

  home.packages = with pkgs; [ distrobox ];
  # programs.distrobox = {
  #   enable = true;
  #   package = pkgs.distrobox;
  #   enableSystemdUnit = false;
  #
  #   debian-dev = {
  #     image = "debian:13";
  #     entry = true;
  #     additional_packages = "bash-completion git vim";
  #     init_hooks = [
  #       "ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/docker"
  #       "ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/docker-compose"
  #     ];
  #   };
  # };
}
