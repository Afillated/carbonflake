{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../system
    ../apps
    ../gaming
    ../devlopment
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.initrd.supportedFilesystems = [ "btrfs" ];

  networking.hostName = "carbon"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  nixpkgs.config.allowUnfree = true;

  services.udev.extraRules = ''
    ACTION=="add|bind", SUBSYSTEM=="platform", KERNEL=="VPC2004:00", \
      RUN+="${pkgs.coreutils}/bin/chgrp power %S%p/conservation_mode", \
      RUN+="${pkgs.coreutils}/bin/chmod g+w %S%p/conservation_mode"
  '';
  users.groups.power = { };

  # A little something that helps
  services.logind.settings.Login = {
    HandlePowerKey = "ignore";
  };

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.05";
}
