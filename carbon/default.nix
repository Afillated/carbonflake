{
  config,
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


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.carbon = {
    isNormalUser = true;
    description = "Afillatedcarbon";
    extraGroups = [
      "networkmanager"
      "wheel"
      "gamemode"
    ];
    packages = with pkgs; [ ];
  };

  nixpkgs.config.allowUnfree = true;

  #Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;

  };


  system.stateVersion = "25.05";

}
