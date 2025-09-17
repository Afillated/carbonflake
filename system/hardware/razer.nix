{
  config,
  pkgs,
  inputs,
  ...
}: {
    environment.systemPackages = with pkgs; [
      polychromatic
      openrazer-daemon
    ];
  }
