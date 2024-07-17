{ pkgs
, ...
}: {
  imports = [
    ./bash.nix
    ./bat.nix
    ./btop.nix
    ./env_variables.nix
    ./direnv.nix
    ./git.nix
    ./neofetch.nix
    ./nix.nix
    ./nvim.nix
    ./scripts.nix
    ./starship.nix
    ./tmux.nix
    ./xdg.nix
  ];

  programs = {
    eza.enable = true;
    jq.enable = true;
  };

  home.packages = with pkgs; [
    xclip
  ];
}
