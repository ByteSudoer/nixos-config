{ pkgs, desktop, ... }:
{
  home.packages = with pkgs; [ dropbox ] ++ lib.optional (desktop == "i3") snixembed;
}
