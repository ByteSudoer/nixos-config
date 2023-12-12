{ pkgs
, ...
}: {
  imports = [
    ./bat.nix
    ./git.nix
    ./starship.nix
    ./tmux.nix
  ];

  programs = {
    eza.enable = true;
    git.enable = true;
    home-manager.enable = true;
    jq.enable = true;
  };


  home.packages = with pkgs; [ ];
}
