# This file defines overlays
{
  inputs,
  colorscheme,
  ...
}:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions =
    final: _prev:
    import ../pkgs {
      pkgs = final;
      inherit colorscheme;
    };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays

  modifications = _final: _prev: {
    # ciscoPacketTracer8 = prev.ciscoPacketTracer8.overrideAttrs (_oldAttrs: rec {
    #   desktopItems = [
    #     (prev.makeDesktopItem {
    #       name = "cisco-pt8.desktop";
    #       desktopName = "Cisco Packet Tracer 8";
    #       icon = "ciscoPacketTracer8";
    #       exec = "GTK_THEME=Adwaita:light packettracer8 %f";
    #       mimeTypes = [
    #         "application/x-pkt"
    #         "application/x-pka"
    #         "application/x-pkz"
    #       ];
    #     })
    #   ];
    # });
  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };
}
