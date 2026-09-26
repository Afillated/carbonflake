{
  lib,
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

  systemd.services.set-conservation-mode = {
    description = "Set Lenovo Conservation Mode to 80% limit";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.bash}/bin/bash -c 'echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'";
    };
  };

  specialisation.mobile.configuration = {
    system.nixos.tags = [ "mobile" ];

    systemd.services.set-conservation-mode.serviceConfig.ExecStart =
      lib.mkForce "${pkgs.bash}/bin/bash -c 'echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'";
  };

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
