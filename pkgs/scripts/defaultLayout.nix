{ pkgs, ... }:
pkgs.writeShellScriptBin "defaultLayout" ''

  set -x

  # Get hostname
  hostname="$(hostname)"
  # Detect if running in Virtual-Machine
  virt="$(systemd-detect-virt)"
  session_type="$XDG_SESSION_TYPE"

  if [ "$virt" = "kvm" ] || [ "$virt" = "oracle" ]; then
      primary="Virtual-1"
      xrandr --output "$primary" --primary --mode 1920x1200 --pos 0x0 --rotate normal
  else
      primary="eDP-1"
      if [ "$session_type" == "x11" ]; then
          external="HDMI-1"
      else
          external="HDMI-A-1"
      fi

      if xrandr | grep -q "^$external connected"; then
          xrandr --output "$primary" --mode 1920x1200 --pos 1920x0 --rotate normal \
                 --output "$external" --primary --mode 1920x1080 --pos 0x0 --left-of "$primary" --rotate normal
      else
          xrandr --output "$primary" --primary --mode 1920x1200 --pos 0x0 --rotate normal \
                 --output DP-1 --off --output "$external" --off --output HDMI-1-1 --off
      fi
  fi

''
