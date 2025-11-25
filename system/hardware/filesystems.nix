{config, pkgs, ... }: {
  fileSystems."/games" = {
    device = "/dev/disk/by-uuid/fdfc0e35-5cbb-4aa6-9dee-e52308edbab7";
    fsType = "btrfs";
    options = [ "nofail" "compress=zstd" ];
  };

  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = ["/games"];
  };
}
