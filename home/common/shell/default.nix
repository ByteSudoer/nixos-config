{ pkgs
, ...
}: {
  imports = [
    ./bash.nix
    ./bat.nix
    ./git.nix
    ./neofetch.nix
    ./nix.nix
    # ./helix.nix
    # ./neofetch.nix
    ./starship.nix
    ./tmux.nix
    ./xdg.nix
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
