{comfig, pkgs, ... }: {
  fileSystems."/games" = {
    device = "/dev/disk/by-uuid/35367dd6-acc7-499f-aa6c-03eece5677ec";
    fsType = "btrfs";
    options = [ "nofail" "compress=zstd" ];
  };
}
