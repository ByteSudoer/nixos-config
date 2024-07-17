{ pkgs
, ...
}: {
  imports = [
    ./bash.nix
    ./bat.nix
    ./btop.nix
    ./env_variables.nix
    ./direnv.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./git.nix
    ./gh.nix
    ./neofetch.nix
    ./nix.nix
    ./nvim.nix
    ./scripts.nix
    ./starship.nix
    ./tmux.nix
    ./xdg.nix
  ];

  programs = {
    jq.enable = true;
  };

  home.packages = with pkgs; [
    xclip
  ];
}
