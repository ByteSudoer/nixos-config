_: {
  programs.ngrok = {
    enable = false;
    settings = {
      version = 2;
      # authtoken = "${config.sops.placeholder.ngrok_token}";
    };
  };
}
