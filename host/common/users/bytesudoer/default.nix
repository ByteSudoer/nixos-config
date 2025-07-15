{
  pkgs,
  config,
  username,
  terminal,
  ...
}:
let
  ifExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = true;
  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.bash;
    hashedPassword = "$6$bF6bcFWzGjYi2xuV$YQtyWi6VAAQlnQgzA7g0YcuWWJBw3Kgyat.6Qhu6PAh1hbF.yO1JWlZloQa3t/K4XUqpZPlnItMEh0pwHP28N1";
    extraGroups =
      [
        "audio"
        "storage"
        "sound"
        "networkmanager"
        "users"
        "video"
        "wheel"
      ]
      ++ ifExists [
        "libvirtd"
        "docker"
        "plugdev"
        "render"
        "lxd"
      ];

    openssh.authorizedKeys.keys = [
      ''
        ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj/FQIaOA6fDCejH8hI1DU7X0zfL/x491kqRECCePRMNWLA+hrSMvpKm6EwDw3bQ82k3F+GAdpMFekYDAeuXpNUcgngDbRYe/RmfcRjaEXzqt13vzsAbSuybIRWp2ziQfbClPBXlCLT8P97jZbZ8/RCmiROeFvWk9s/XGF/3w7p2yBH4+vffHxGAuCYwIFaDyuoaJ/WUOShPsH+dRBeIloqBKbq0ZBLKhFIDEuD0p0XG7J7XSaniK85WQ1dkPNv0Wi47ZXZA9UCCzvFlOPAi3KUI/5u2u9GL2klmX0WGPtV0iLP8p60SovDLmFK65R4zoDVTQyuGb3Cigl+hbq1NuJ/7zZ09bbMwHAOXQBLQmi/HO6fgt+MXK2Ong1SeQO4Fdxjm1iWDHP1VCoij3FSeK6WWSvXyFzf8g5SJlaQt+I2Hel0DHVKYnlbYf6/nrroV+8UGI1AP/Hiiuppashx5Iu5jTvSlwQSL74XOMPoAN5ukAmbzAYuQn+xJ6vRhjIXAc= Nix VM Key
      ''
      ''
        ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3yoIYJgUVglyw51az43yhiMcF8DQ2GB9e5akGn0ZHpH2m7XSaq33+3O29vpUB/r7ABQj15GvaikNJL+hBMF1sq/P3a+Jqgs/tLKQnDm+AeqZ6TOz+5guLW9Do5Ktzd6pu9DliG1UNyv8HWBjS4Wlabspwe/JgM39r+GpYqjlHPXkieU9P6V8Gjvx1pY3x4Uum5qrlkZnU5KGquRD8W8revagERzb/XegDxXx6jdBohvdKSk0nb0gO587HB28Zaunv8BVuITJTydBPrvR9UYbroASqCl1SsXu8gLnPgfoH0jH/bmZArX2X3Ei2QFWXQ18YQ0dY7rKas1OZDhlRcNqqVl2cugw0YZyhGvhCz00Tu/IzkuTQ7/B7QmuLjZr2OTw+EfOEeePTuYbYBQvHbLMhl694DVhxKXZxbB2Oh7XzyG7z7/34Ymymxu61hwBmCIsuVn2hKE09RLTsTrISGnvBob7NGbuo2b+QzF0A18cVySxwTXMUL6jCklYD29oVKEk= Rasbperry PI Key
      ''
    ];

    packages = [ pkgs.home-manager ];
  };

  # This is a workaround for not seemingly being able to set $EDITOR in home-manager
  environment.sessionVariables = {
    EDITOR = "nvim";
    TERM = "${terminal}";
  };
}
