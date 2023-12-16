_:{
  home = {
    file.".ssh/config".text = "
      Host github.com
        User git 
        Hostname github.com
        IdentityFile ~/.ssh/github_key
    "
  }
}
