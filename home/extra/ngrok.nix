_:
{
  programs.ngrok = {
    enable = true;
    settings = {
      version = 2;
      # authtoken = "${config.sops.placeholder.ngrok_token}";
    };
  };
}
