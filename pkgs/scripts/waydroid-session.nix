{ pkgs, ... }:

pkgs.writeShellScriptBin "waydroid_session" ''
  ${pkgs.weston}/bin/weston --xwayland &

  WESTON_PID=$!
  export WAYLAND_DISPLAY=wayland-1
  sleep 2
  ${pkgs.waydroid}/bin/waydroid show-full-ui &

  WAYDROID_PID=$1

  trap "waydroid session stop; kill $WESTON_PID; kill $WAYDROID_PID" EXIT
  wait "$WESTON_PID"

''

# #!/bin/bash
#
#
#
# weston --xwayland &
# WESTON_PID=$!
# export WAYLAND_DISPLAY=wayland-1
# sleep 2
#
# waydroid show-full-ui &
# WAYDROID_PID=$!
#
# trap "waydroid session stop; kill $WESTON_PID; kill $WAYDROID_PID" EXIT
#
# wait "$WESTON_PID"
