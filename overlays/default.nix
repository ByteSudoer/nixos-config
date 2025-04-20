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

  modifications =
    final: prev:
    let
      finalAttrs = final.vmware-workstation;
      vmware-unpack-env = prev.buildFHSEnv {
        pname = "vmware-unpack-env";
        inherit (finalAttrs) version;
        targetPkgs = pkgs: [ pkgs.zlib ];
      };
    in
    {
      vmware-workstation = prev.vmware-workstation.overrideAttrs rec {
        src = prev.requireFile rec {
          name = "VMware-Workstation-${finalAttrs.version}-${finalAttrs.build}.x86_64.bundle.tar";
          url = "file:///home/bytesudoer/Downloads/VMware-Workstation-17.6.1-24319023.x86_64.bundle.tar";
          sha256 = "02q8f6rlnzdmdxjjrs37d6n7s8bwivkqrdq61a146s9dv6bfjppg";
        };
        unpackPhase = ''
          tar -xf ${src}
          ${vmware-unpack-env}/bin/vmware-unpack-env -c "sh VMware-Workstation-17.6.1-24319023.x86_64.bundle --extract unpacked"
        '';
      };
    };
  # Optional extras, if you want to include them:
  # ciscoPacketTracer8 = _prev.ciscoPacketTracer8.overrideAttrs (_oldAttrs: rec {
  #   desktopItems = [
  #     (_prev.makeDesktopItem {
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

  # flameshot-wayland = _prev.flameshot.overrideAttrs {
  #   enableWlrSupport = true;
  # };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };
}
