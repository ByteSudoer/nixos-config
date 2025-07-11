{
  pkgs,
  sudo,
  lib,
  ...
}:
{
  security = {
    sudo = {
      enable = sudo == "sudo";
    };
    sudo-rs = {
      enable = true;
      package = pkgs.sudo-rs;
      execWheelOnly = lib.mkForce true;
      wheelNeedsPassword = lib.mkForce true;
    };

  };

}
