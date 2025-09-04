{
  config,
  inputs,
  pkgs,
  ...
}: {
    imports = [
      ../gaming/vesktop.nix
      ../gaming/steam.nix
    ];
  }
