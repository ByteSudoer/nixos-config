_: {
  home = {
    file.".ssh/config".text = "
      Host github.com
        User git 
        Hostname github.com
        IdentityFile ~/.ssh/github_key
      Host pi
        User bytesudoer
        Hostname 192.168.100.29
        IdentityFile ~/.ssh/raspberry_pi
    ";
  };
}
