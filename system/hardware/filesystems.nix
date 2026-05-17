{ config, pkgs, ... }:
{
  fileSystems."/games" = {
    device = "/dev/disk/by-uuid/0e703968-ca59-4e3d-bbea-16aab36412cc";
    fsType = "btrfs";
    options = [
      "nofail"
      "compress=zstd"
    ];
  };

  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/games" ];
  };

  services.btrbk = {
    instances.games-backup = {
      onCalendar = "daily";
      settings = {
        snapshot_preserve = "14d";
        snapshot_preserve_min = "2d";
        volume = {
          "/games" = {
            snapshot_dir = ".snapshots";
            subvolume = ".";
          };
        };
      };
    };
  };
}
