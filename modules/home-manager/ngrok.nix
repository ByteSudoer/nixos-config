{ config, lib, pkgs, ... }:

let
  cfg = config.programs.ngrok;
  yamlFormat = pkgs.format.yaml { };
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
    settings = lib.mkOpton
      {
        type = yamlFormat.type;
        default = { };
        example = lib.literalExpression ''
          authtoken = 4nq9771bPxe8ctg7LKr_2ClH7Y15Zqe4bWLWF9p;
          api_key = 24yRd5U3DestCQapJrrVHLOqiAC_7RviwRqpd3wc9dKLujQZN;
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
    home.package = [ cfg.package ];
    xdg.configFile."ngrok/ngrok.yml" = lib.mkIf (cfg.settings != { })
      {
        source = (yamlFormat.generate "ngrok.yml" cfg.settings).overrideAttrs
          (
            finalAttrs: prevAttrs: {
              buildCommand = lib.concatStringSep "\n" [

                prevAttrs.buildCommand
                "substituteInPlace $out --replace '\\\\' '\\'"
              ];
            }
          );
      };
  };
}
