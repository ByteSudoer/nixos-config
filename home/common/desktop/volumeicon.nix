_:
let

  config_file = ../../../config/volumeicon;
in
{

  xdg.configFile."volumeicon" = {
    source = config_file;
  };
}
