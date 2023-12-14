{ pkgs
, ...
}: {
  imports = [
    ./bash.nix
    ./bat.nix
    ./env_variables.nix
    ./direnv.nix
    ./git.nix
    ./neofetch.nix
    ./nix.nix
    ./scripts.nix
    ./starship.nix
    ./tmux.nix
    ./xdg.nix
  ];

  programs = {
    eza.enable = true;
    # git.enable = true;
    # home-manager.enable = true;
    jq.enable = true;
  };

  # services.gpg-agent = {
  #   enable = true;
  #   pinentryFlavor = "curses";
  # };

  home.packages = with pkgs; [ ];
}
