{pkgs, inputs, ...}: {
  boot = {
    # Enable GRUB
    loader.grub = {
      enable = true;
      # version = 2; -not needed anymore
      device = "nodev";
      efiSupport = true;
      enableCryptodisk = false;
      useOSProber = true; # Detect Windows
      default = "saved"; # Default to last booted OS
      configurationLimit = 8;
      # darkmatter-theme = {
      # enable = true;
      # style = "nixos";
      # icon = "color";
      # resolution = "1080p";
      # };
    };
    # kernelPackages = pkgs.linuxPackages_latest;

    loader.efi.canTouchEfiVariables = true;
    plymouth.enable = true;

    # Add NTFS support
    supportedFilesystems = [ "ntfs" ];
  };
}
