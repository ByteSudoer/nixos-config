{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  name = "waydroid-session";

  buildCommand =
    let
      script = pkgs.writeShellApplication {
        name = "waydroid_session";
        runtimeInputs = with pkgs; [
          waydroid
          weston
        ];
        text = ''
          #!/usr/bin/env bash

          # Run networking setup + container startup in one sudo call
          sudo bash -c '
            iptables -t nat -A POSTROUTING -s 192.168.240.0/24 -j MASQUERADE
            iptables -A FORWARD -i waydroid0 -j ACCEPT
            iptables -A FORWARD -o waydroid0 -j ACCEPT

          '

            # if ! ${pkgs.waydroid}/bin/waydroid status | grep -q RUNNING; then
            #   echo "Starting Waydroid container..."
            #   ${pkgs.waydroid}/bin/waydroid container start
            # fi

          # Start Weston nested compositor
          ${pkgs.weston}/bin/weston --xwayland --width=1920 --height=1080 &
          WESTON_PID=$!

          export WAYLAND_DISPLAY=wayland-1
          sleep 2

          # Start Waydroid UI
          ${pkgs.waydroid}/bin/waydroid show-full-ui &
          WAYDROID_PID=$!

          # Cleanup on exit
          trap '
            echo "Stopping Waydroid session..."
            ${pkgs.waydroid}/bin/waydroid session stop
            sudo ${pkgs.waydroid}/bin/waydroid container stop
            kill '$WESTON_PID'
            kill '$WAYDROID_PID'
          ' EXIT

          wait "$WESTON_PID"
        '';
      };

      desktopEntry = pkgs.makeDesktopItem {
        name = "waydroid-session";
        desktopName = "Waydroid Session";
        comment = "Launch Waydroid inside a Weston session";
        exec = "${script}/bin/waydroid_session";
        terminal = false;
        icon = "waydroid";
      };
    in
    ''
      mkdir -p $out/bin
      cp ${script}/bin/waydroid_session $out/bin/

      mkdir -p $out/share/applications
      cp ${desktopEntry}/share/applications/waydroid-session.desktop \
         $out/share/applications/
    '';

  dontBuild = true;
}
