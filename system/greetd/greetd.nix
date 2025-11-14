{ pkgs, inputs, ... }:
{
  services.greetd.enable = true;
  programs.regreet.enable = true;
  # environment.systemPackages = with pkgs; [
  #   # qtgreet
  #   wlgreet
  # ];

  # # services.greetd.settings = {
  #   default_session = {
  #     command = "Hyprland --config /etc/greetd/hyprland-greet.conf";
  #     # Replace 'wayfire' with your desired wlr-based Wayland compositor
  #   };
  # };


  #Something I wanted to try, trying to use hyprlock as the login screen in a way lol
  # services.xserver.displayManager.lightdm.enable = false; 
  # services.getty.autologinUser = "carbon"; 
  # environment.loginShellInit = ''
  #   # Launch Hyprland on TTY1, return to TTY when exiting
  #   if [ "$(tty)" = "/dev/tty1" ]; then
  #     uwsm start hyprland 
  #   fi
  # '';
}
