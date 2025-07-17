{ pkgs, ... }:
{
  virtualisation = {
    docker = {
      enable = true;
      package = pkgs.docker;
      autoPrune = {
        enable = true; # periodically prune Docker resources.
        dates = "weekly"; # Specification (in the format described by systemd.time(7)) of the time at which the prune will occur.

      };
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    ctop
  ];
}
