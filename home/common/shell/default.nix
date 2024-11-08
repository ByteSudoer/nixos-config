{ pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./bat.nix
    ./btop.nix
    ./direnv.nix
    ./env_variables.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./gh.nix
    ./git.nix
    ./info.nix
    ./jq.nix
    ./neofetch.nix
    ./nix.nix
    ./nix-init.nix
    ./nvim.nix
    ./ripgrep.nix
    ./scripts.nix
    ./starship.nix
    ./tmux.nix
    ./xdg.nix
  ];

  programs = {
    jq.enable = true;
  };

  home.packages = with pkgs; [ xclip ];
}
