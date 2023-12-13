{ pkgs
, ...
}:
{
  console = {
    keyMap = "fr";
    earlySetup = true;
    packages = with pkgs; [ terminus_font powerline-fonts ];
    font = "ter-powerline-v24n";
  };
}
