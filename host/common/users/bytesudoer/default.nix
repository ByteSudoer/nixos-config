{ pkgs
, config
, ...
}:
let
  ifExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.users.bytesudoer = {
    isNormalUser = true;
    shell = pkgs.bash;
    extraGroups =
      [
        "audio"
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
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj/FQIaOA6fDCejH8hI1DU7X0zfL/x491kqRECCePRMNWLA+hrSMvpKm6EwDw3bQ82k3F+GAdpMFekYDAeuXpNUcgngDbRYe/RmfcRjaEXzqt13vzsAbSuybIRWp2ziQfbClPBXlCLT8P97jZbZ8/RCmiROeFvWk9s/XGF/3w7p2yBH4+vffHxGAuCYwIFaDyuoaJ/WUOShPsH+dRBeIloqBKbq0ZBLKhFIDEuD0p0XG7J7XSaniK85WQ1dkPNv0Wi47ZXZA9UCCzvFlOPAi3KUI/5u2u9GL2klmX0WGPtV0iLP8p60SovDLmFK65R4zoDVTQyuGb3Cigl+hbq1NuJ/7zZ09bbMwHAOXQBLQmi/HO6fgt+MXK2Ong1SeQO4Fdxjm1iWDHP1VCoij3FSeK6WWSvXyFzf8g5SJlaQt+I2Hel0DHVKYnlbYf6/nrroV+8UGI1AP/Hiiuppashx5Iu5jTvSlwQSL74XOMPoAN5ukAmbzAYuQn+xJ6vRhjIXAc= Nix VM Key
"
    ];

    packages = [ pkgs.home-manager ];
  };

  # This is a workaround for not seemingly being able to set $EDITOR in home-manager
  environment.sessionVariables = {
    EDITOR = "nvim";
    TERM = "alacritty";
  };
}
