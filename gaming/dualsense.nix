{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [ dualsensectl ];

  # 1. Force the official Sony driver
  boot.kernelModules = [ "hid_playstation" ];

  # 2. Provide the udev rules that tell the system how to handle the device nodes
  services.udev.packages = [ pkgs.game-devices-udev-rules ];

  # 3. Ensure WirePlumber is looking at the UCM profiles
  environment.variables.ALSA_CONFIG_UCM2 = "${pkgs.alsa-ucm-conf}/share/alsa/ucm2";

  services.pipewire.wireplumber.extraConfig = {
    "15-dualsense-remap" = {
      "monitor.alsa.rules" = [
        {
          matches = [
            {
              # Match by the hardware card name reported in your wpctl inspect
              "alsa.card_name" = "DualSense Wireless Controller";
            }
          ];
          actions = {
            update-props = {
              # Map physical pins 3 and 4 (AUX2/3) to the OS Stereo Left/Right
              "audio.position" = [
                "AUX2"
                "AUX3"
                "AUX0"
                "AUX1"
              ];
              "node.description" = "DualSense Headphones (Fixed)";
            };
          };
        }
      ];
    };
  };
}
