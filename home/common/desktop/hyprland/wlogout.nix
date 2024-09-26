{ pkgs, colorscheme, ... }:
let
  icons_path = "/home/bytesudoer/nixos-config/config/icons";
  background-color-main-window = if colorscheme == "dracula" then "#1E1E2E" else "#32302F";
  background-color-main-button = if colorscheme == "dracula" then "#242434" else "#665C54";
  hover-button-color = if colorscheme == "dracula" then "#89B4FA" else "#FABD2F";
in
{
  programs.wlogout = {
    enable = true;
    package = pkgs.wlogout;

    layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
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
        action = "loginctl kill-user $USER";
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
      	background-color: ${background-color-main-window};
      }

      /** ********** Buttons ********** **/
      button {
      	background-color: ${background-color-main-button};
        color: #FFFFFF;
      	border: 2px solid #282838;
      	border-radius: 20px;
      	background-repeat: no-repeat;
      	background-position: center;
      	background-size: 35%;
      }

      button:focus, button:active, button:hover {
      	background-color: ${hover-button-color};
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
