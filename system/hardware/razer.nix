{
  config,
  pkgs,
  inputs,
  ...
}: {
    hardware.openrazer.enable = true;
    environment.systemPackages = with pkgs; [
      polychromatic
      openrazer-daemon
    ];
    users.users.carbon.extraGroups = [ "openrazer" ];
  }
