{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.drawio;
  jsonFormat = pkgs.formats.json { };
in
{
  meta.maintainers = with lib.maintainers; [ ByteSudoer ];
  options.programs.drawio = {

    enable = lib.mkEnableOption "Draw.io Diagram Application";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.drawio;
      defaultText = lib.literalExpression "pkgs.drawio";
      description = "The Draw.io package to install";
    };
    settings = lib.mkOption {
      inherit (jsonFormat) type;
      default = { };
      example = lib.litteralExpression ''
        {
          enableSpellCheck =  false;
          isGoogleFontsEnabled =  true;
        }
      '';
      description = ''
        Configuration written to
        {file}`$XDG_CONFIG_HOME/draw.io/config.json`
        see <https://www.drawio.com/doc/faq/configure-diagram-editor>
        for more info.
      '';
    };
    preferences = lib.mkOption {
      inherit (jsonFormat) type;
      default = { };
      example = lib.literalExpression ''
        {
          language = "";
          configVersion = null;
        }
      '';
      description = ''
        Configuration written to
        {file}`$XDG_CONFIG_HOME/draw.io/Preferences`
        see <https://www.drawio.com/doc/faq/configure-diagram-editor>
        for more info.
      '';

    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];
    xdg.configFile."draw.io/config.json" = lib.mkIf (cfg.settings != { }) {
      source = (jsonFormat.generate "config.json" cfg.settings);
    };
    xdg.configFile."draw.io/Preferences" = lib.mkIf (cfg.preferences != { }) {
      source = (jsonFormat.generate "Preferences" cfg.preferences);
    };
  };
}
