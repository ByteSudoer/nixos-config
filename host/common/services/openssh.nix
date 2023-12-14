_: {
  services.openssh = {
    enable = true;
    extraConfig = ''
      Host github.com
         User git
         Hostname github.com
         IdentityFile ~/.ssh/github_key
    '';
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  programs.ssh.startAgent = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
}
