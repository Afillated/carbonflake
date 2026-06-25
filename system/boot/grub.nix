{ pkgs, inputs, ... }: {
  boot = {
    # Enable GRUB
    loader.grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      enableCryptodisk = false;
      useOSProber = true; # Detect Windows
      default = "saved"; # Default to last booted OS
      configurationLimit = 8;
      theme = inputs.grub-themes.packages.${pkgs.stdenv.hostPlatform.system}.nixos;
    };
    loader.efi.canTouchEfiVariables = true;
    # Add NTFS support
    supportedFilesystems = [ "ntfs" ];
  };
}
