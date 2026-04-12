{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [ dualsensectl ];

  boot.kernelModules = [ "hid_playstation" ];

  services.udev.packages = [ pkgs.game-devices-udev-rules ];

  environment.variables.ALSA_CONFIG_UCM2 = "${pkgs.alsa-ucm-conf}/share/alsa/ucm2";

}
