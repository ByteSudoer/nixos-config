{ pkgs
, ...
}: {
  imports = [
    ./bat.nix
    ./git.nix
    # ./helix.nix
    # ./neofetch.nix
    # ./starship.nix
    # ./tmux.nix
  ];

  programs = {
    eza.enable = true;
    git.enable = true;
    home-manager.enable = true;
    jq.enable = true;
  };

  # services.gpg-agent = {
  #   enable = true;
  #   pinentryFlavor = "curses";
  # };

  home.packages = with pkgs; [ ];
}
