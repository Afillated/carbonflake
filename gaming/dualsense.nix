{config,pkgs, ...}: {

  environment.systemPackages = with pkgs; [ dualsensectl ];

  # services.udev.packages = [
  #   (pkgs.writeTextFile {
  #     name = "dualsense_udev";
  #     text = ''
  #         # Disable DualSense Touchpad acting as mouse
  #         # USB
  #         ATTRS{name}=="DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  #         # Bluetooth
  #         ATTRS{name}=="Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  #       '';
  #     destination = "/etc/udev/rules.d/50-dualsense-trackpad.rules";
  #   })
    
      
      
  
}
