{ pkgs, ... }:
{
  programs.wlogout = {
    enable = true;
    package = pkgs.wlogout;

    layout = [
      {
        label = "shutdown";
        action = "systemctl shutdown";
        text = "Shutdown";
      }
      {
        label = "lock";
        action = "lock";
        text = "Lock Screen";
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
          background-image: image(url("../../../../config/icons/lock.png"), url("/usr/share/wlogout/icons/lock.png"));
      }

      #logout {
          background-image: image(url("../../../../config/icons/logout.png"), url("/usr/share/wlogout/icons/logout.png"));
      }

      #suspend {
          background-image: image(url("../../../../config/icons/suspend.png"), url("/usr/share/wlogout/icons/suspend.png"));
      }

      #hibernate {
          background-image: image(url("../../../../config/icons/hibernate.png"), url("/usr/share/wlogout/icons/hibernate.png"));
      }

      #shutdown {
          background-image: image(url("../../../../config/icons/shutdown.png"), url("/usr/share/wlogout/icons/shutdown.png"));
      }

      #reboot {
          background-image: image(url("../../../../config/icons/reboot.png"), url("/usr/share/wlogout/icons/reboot.png"));
      }
    '';


  };
}
