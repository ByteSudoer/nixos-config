{ lib, hostname, ... }:
let
  isInList = element: list: builtins.elem element list;
  hostnames = [
    "vm"
    "vm-mini"
  ];
  # Don't open the firewall for SSH on laptops; Only for virtual machines
  openSSHFirewall = if (isInList hostname hostnames) then true else false;
in
{
  programs = {
    ssh.startAgent = true;
  };
  services = {
    openssh = {
      enable = true;
      openFirewall = openSSHFirewall;
      ports = [ 22222 ];
      settings = {
        PasswordAuthentication = isInList hostname hostnames;
        PermitRootLogin = lib.mkDefault "no";
      };
    };

    sshguard = {
      enable = true;

      # Services to monitor
      services = [
        "sshd" # SSH
        "nginx" # Web server
        "vsftpd" # FTP server
        "postfix" # SMTP server
        "dovecot" # IMAP/POP3 server
        # Add other known services or logs
        "/var/log/auth.log" # fallback
        "/var/log/nginx/error.log" # additional nginx
        "/var/log/mail.log" # system mail log
      ];

      # Tuning parameters
      blocktime = 3600; # Block IP for 1 hour
      detection_time = 300; # 5 minutes window
      attack_threshold = 3; # Block after 3 failed attempts
      blacklist_threshold = 10; # Permanently block after 10 total
      whitelist = [
        "127.0.0.1" # Loopback
        "::1" # Loopback
        #"192.168.0.0/16" # Local network
      ];
    };

  };
}
