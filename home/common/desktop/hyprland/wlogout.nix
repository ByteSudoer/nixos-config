{ pkgs, ... }:
{
  programs.wlogout = {
    enable = true;
    package = pkgs.wlogout;

    # layout = [
    #
    #   {
    #     label = "shutdown";
    #     action = "systemctl shutdown";
    #     text = "Shutdown";
    #   }
    # ];

  };
}
