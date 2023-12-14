_: {
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  programs.ssh.startAgent = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
    #Configure SSH
  programs.ssh = {
    extraConfig = ''
      Host github.com
         User git
         Hostname github.com
         IdentityFile ~/.ssh/github_key
    '';
  };
}
