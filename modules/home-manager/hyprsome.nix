{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.programs.hyprsome;
in
{
  options = {
    programs.hyprsome = {
      enable = mkEnableOption "hyprsome";
      package = mkOption {
        type = types.package;
        default = pkgs.hyprsome;
        defaultText = literalExpression "pkgs.hyprsome";
        description = "The hyprsome package to install";
      };
    };
  };

  config = mkIf cfg.enable { home.packages = [ cfg.package ]; };
}
