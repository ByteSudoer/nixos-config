{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.programs.nix-init;
  tomlFormat = pkgs.formats.toml { };
in
{
  options = {
    programs.nix-init = {
      enable = mkEnableOption "nix-init";
      package = mkOption {
        type = types.package;
        default = pkgs.nix-init;
        defaultText = literalExpression "pkgs.nix-init";
        description = "The nix-init package to install";
      };
      settings = mkOption {
        inherit (tomlFormat) type;
        default = { };
        example = literalExpression ''
          maintainers = "Username";
          nixpkgs = "<nixpkgs>";
          commit = true;
          access-tokens = {
            github.com = "XXXXXXXX";
            gitlab.com.command = [
              "secret-tool"
              "or"
              "XXXX"
            ];
          }
        '';
        description = ''
          Configuration written to 
          {file}`$XDG_CONFIG_HOME`/nix-init/config.toml
          see <https://github.com/nix-community/nix-init#configuration>
          for more configuration options
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];
    xdg.configFile."nix-init/config.toml" = lib.mkIf (cfg.settings != { }) {
      source = (tomlFormat.generate "config.toml" cfg.settings).overrideAttrs (
        _finalAttrs: prevAttrs: {
          buildCommand = lib.concatStringsSep "\n" [
            prevAttrs.buildCommand
            "substituteInPlace $out --replace '\\\\' '\\'"
          ];
        }
      );
    };
  };
}
