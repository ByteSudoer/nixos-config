{
  pkgs,
  ...
}:
{
  services = {
    preload = {
      enable = false;
      package = pkgs.preload;
    };

  };

}
