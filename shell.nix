{ pkgs ? (import ./nixpkgs.nix) { } }: {
  default = pkgs.mkShell {
    name = "dotfiles";
    # Enable experimental features without having to specify the argument
    NIX_CONFIG = "experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [
      wget
      curl
      gnumake
      nix
      home-manager
      git
      nurl
      nix-prefetch-github
    ];
  };
}
