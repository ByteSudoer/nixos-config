{ config, lib, pkgs, ... }:

let
  cfg = config.programs.ngrok;
  yamlFormat = pkgs.formats.yaml { };
in
{
  meta.maintainers = with lib.maintainers;[ ByteSudoer ];
  options.programs.ngrok = {
    enable = lib.mkEnableOption "ngrok is your app’s front door.A globally distributed reverse proxy";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.ngrok;
      defaultText = lib.literalExpression "pkgs.ngrok";
      description = "The ngrock package to install";
    };
    settings = lib.mkOption
      {
        type = yamlFormat.type;
        default = { };
        example = lib.literalExpression ''
          authtoken = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
          api_key = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
          connect_timeout =  30s
          dns_resolver_ips = [
            1.1.1.1
            8.8.8.8
          ];
        '';
        description = ''
          Configuration written to
          {file}`$XDG_CONFIG_HOME/ngrok/ngrok.yml`
          see <https://ngrok.com/docs/agent/config/>
          for more info.
        '';
      };
  };
  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];
    xdg.configFile."ngrok/ngrok.yml" = lib.mkIf (cfg.settings != { })
      {
        source = (yamlFormat.generate "ngrok.yml" cfg.settings).overrideAttrs
          (
            finalAttrs: prevAttrs: {
              buildCommand = lib.concatStringsSep "\n" [

                prevAttrs.buildCommand
                "substituteInPlace $out --replace '\\\\' '\\'"
              ];
            }
          );
      };
  };
}
