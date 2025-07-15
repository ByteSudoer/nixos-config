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
      enable = sudo == "sudo-rs";
      package = pkgs.sudo-rs;
      execWheelOnly = lib.mkForce true;
      wheelNeedsPassword = lib.mkForce true;
    };

  };

}
