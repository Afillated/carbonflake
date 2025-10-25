{
  config,
  inputs,
  pkgs,
  ...
}: {
    imports = [
      ./steam.nix
      ./dualsense.nix
      ./vesktop.nix
      ./emulators.nix
      ./modmanagers.nix
    ];


  }
