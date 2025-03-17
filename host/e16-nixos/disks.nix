{
  disks ? [
    "/dev/nvme0n1"
    "/dev/nvme1n1"
  ],
  ...
}:
# {
#   disko.devices = {
#     disk = {
#       nvme = {
#         device = builtins.elemAt disks 0;
#         type = "disk";
#         content = {
#           type = "gpt";
#           partitions = {
#             ESP = {
#               size = "500M";
#               type = "EF00";
#               content = {
#                 type = "filesystem";
#                 format = "vfat";
#                 mountpoint = "/boot";
#               };
#             };
#             root = {
#               end = "-5G";
#               content = {
#                 type = "filesystem";
#                 format = "ext4";
#                 mountpoint = "/";
#               };
#             };
#             encryptedSwap = {
#               size = "100M";
#               content = {
#                 type = "swap";
#                 randomEncryption = true;
#                 priority = 100; # prefer to encrypt as long as we have space for it
#               };
#             };
#             plainSwap = {
#               size = "100%";
#               content = {
#                 type = "swap";
#                 discardPolicy = "both";
#                 resumeDevice = true; # resume from hiberation from this device
#               };
#             };
#           };
#         };
#       };
#     };
#   };
# }
#
{
  disko.devices = {
    disk = {
      root_disk = {
        type = "disk";
        device = builtins.elemAt disks 1;
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
              start = "1M";
              end = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [
                  "-L"
                  "nixos"
                  "-f"
                ];
                subvolumes = {
                  "/rootfs" = {
                    mountpoint = "/";
                  };
                  "/nix" = {
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                    mountpoint = "/nix";
                  };
                  "/swap" = {
                    mountpoint = "/.swapvol";
                    swap = {
                      swapfile.size = "8G";
                    };
                  };
                };
              };
            };
          };
        };
      };

      home_disk = {
        type = "disk";
        device = builtins.elemAt disks 1;
        content = {
          type = "gpt";
          partitions = {
            home = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                subvolumes = {
                  "/home" = {
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                    mountpoint = "/home";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
