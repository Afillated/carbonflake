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
    ];


    environment.systemPackages = with pkgs; [ryubing];
  }
