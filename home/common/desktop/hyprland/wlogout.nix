{ pkgs, ... }:
let
  icons_path = "/home/bytesudoer/nixos-config/config/icons";
in
{
  programs.wlogout = {
    enable = true;
    package = pkgs.wlogout;

    layout = [
      {
        label = "shutdown";
        action = "systemctl shutdown";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "lock";
        action = "lock";
        text = "Lock Screen";
        keybind = "l";
      }
      {
        label = "logout";
        action = "hyprctl exit";
        text = "Logout";
        keybind = "k";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "suspend";
        action = "systemctl hibernate";
        text = "Suspend";
        keybind = "p";
      }
    ];

    style = ''
            /** ********** Fonts ********** **/
        * {
          font-family: "JetBrains Mono", "Iosevka Nerd Font", archcraft, sans-serif;
          font-size: 14px;
          font-weight: bold;
      }

      /** ********** Main Window ********** **/
      window {
      	background-color: #1E1E2E;
      }

      /** ********** Buttons ********** **/
      button {
      	background-color: #242434;
          color: #FFFFFF;
      	border: 2px solid #282838;
      	border-radius: 20px;
      	background-repeat: no-repeat;
      	background-position: center;
      	background-size: 35%;
      }

      button:focus, button:active, button:hover {
      	background-color: #89B4FA;
      	outline-style: none;
      }

      /** ********** Icons ********** **/
      #lock {
          background-image: image(url("${icons_path}/lock.png"));
      }

      #logout {
          background-image: image(url("${icons_path}/logout.png"));
      }

      #suspend {
          background-image: image(url("${icons_path}/suspend.png"));
      }

      #hibernate {
          background-image: image(url("${icons_path}/hibernate.png"));
      }

      #shutdown {
          background-image: image(url("${icons_path}/shutdown.png"));
      }

      #reboot {
          background-image: image(url("${icons_path}/reboot.png"));
      }
    '';


  };
}
