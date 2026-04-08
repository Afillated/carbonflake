{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [ dualsensectl ];
  boot.kernelModules = [ "hid_playstation" ];
  services.udev.packages = [ pkgs.game-devices-udev-rules ];
  environment.variables.ALSA_CONFIG_UCM2 = "${pkgs.alsa-ucm-conf}/share/alsa/ucm2";

  #I give up with man
  # services.pipewire.wireplumber.extraConfig = {
  #   "15-dualsense-remap" = {
  #     "monitor.alsa.rules" = [
  #       {
  #         matches = [
  #           {
  #             # Match by the hardware card name reported in your wpctl inspect
  #             "alsa.card_name" = "DualSense Wireless Controller";
  #           }
  #         ];
  #         actions = {
  #           update-props = {
  #             # Map physical pins 3 and 4 (AUX2/3) to the OS Stereo Left/Right
  #             "audio.position" = [
  #               "AUX2"
  #               "AUX3"
  #               "AUX0"
  #               "AUX1"
  #             ];
  #             "node.description" = "DualSense Headphones (Fixed)";
  #           };
  #         };
  #       }
  #     ];
  #   };
  # };
}
