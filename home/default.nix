{
  config,
  extra,
  desktop,
  lib,
  outputs,
  stateVersion,
  username,
  pkgs,
  ...
}:
{
  # Only import desktop configuration if the host is desktop enabled
  # Only import user specific configuration if they have bespoke settings
  imports =
    [
      # If you want to use modules your own flake exports (from modules/home-manager):
      outputs.homeManagerModules.drawio
      outputs.homeManagerModules.ngrok
      outputs.homeManagerModules.nix-init

      # Or modules exported from other flakes (such as nix-colors):
      # inputs.nix-colors.homeManagerModules.default

      ./common/shell
    ]
    ++ lib.optional (builtins.isString desktop) ./common/desktop
    ++ lib.optional (builtins.isString extra) ./extra
    ++ lib.optional (builtins.pathExists (./. + "/users/${username}")) ./users/${username};

  home = {
    inherit username stateVersion;
    homeDirectory = "/home/${username}";
    activation.report-changes = config.lib.dag.entryAnywhere ''
      ${pkgs.nvd}/bin/nvd diff $oldGenPath $newGenPath
    '';
  };

  sops = lib.mkIf (username == "bytesudoer") {
    # sops-nix options: https://dl.thalheim.io/
    age = {
      keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
      # Generate key if the one above does not exist
      generateKey = true;
    };
    defaultSopsFile = ../secrets/secrets.yaml;
    secrets = {
      github_key.path = "${config.home.homeDirectory}/.ssh/github_key";
      github_key_pub.path = "${config.home.homeDirectory}/.ssh/github_key.pub";
      github_uni.path = "${config.home.homeDirectory}/.ssh/github_uni";
      github_uni_pub.path = "${config.home.homeDirectory}/.ssh/github_uni.pub";
      raspberry_pi.path = "${config.home.homeDirectory}/.ssh/raspberry_pi";
      raspberry_pi_pub.path = "${config.home.homeDirectory}/.ssh/raspberry_pi.pub";
      github_token = { };
      ngrok_token = { };
    };

  };

  # nixpkgs = {
  #   overlays = [
  #     # Add overlays your own flake exports (from overlays and pkgs dir):
  #     outputs.overlays.additions
  #     outputs.overlays.modifications
  #     outputs.overlays.unstable-packages
  #
  #     # You can also add overlays exported from other flakes:
  #     # inputs.crafts.overlay
  #     # inputs.agenix.overlays.default
  #   ];
  #   # ++ lib.optionals (desktop == "hyprland") [
  #   #   inputs.hyprland.overlays.default
  #   #   inputs.hyprland-contrib.overlays.default
  #   # ];
  #
  #   config = {
  #     # Disable if you don't want unfree packages
  #     allowUnfree = true;
  #     # Workaround for https://github.com/nix-community/home-manager/issues/2942
  #     allowUnfreePredicate = _: true;
  #     permittedInsecurePackages = [
  #       "electron-25.9.0"
  #     ];
  #   };
  # };

}
