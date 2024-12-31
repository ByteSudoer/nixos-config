{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.ghostty;
  tomlFormat = pkgs.formats.toml { };
in
{
  meta.maintainers = with lib.maintainers; [ ByteSudoer ];
  options.programs.ghostty = {

    enable = lib.mkEnableOption "Ghostty Terminal Emulator";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.unstable.ghostty;
      defaultText = lib.literalExpression "pkgs.ghostty";
      description = "The ghostty package to install";
    };
    settings = lib.mkOption {
      inherit (tomlFormat) type;
      default = { };
      example = lib.litteralExpression '''';
      description = ''
        Configuration written to
        {file}`$XDG_CONFIG_HOME/ghostty/config`
        see <https://ghostty.org/docs/config>
        for more info.
      '';
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];
    xdg.configFile."ghostty/config" = lib.mkIf (cfg.settings != { }) {
      source = (tomlFormat.generate "config" cfg.settings);
    };
  };
}
