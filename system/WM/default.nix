{ pkgs, inputs, ... }:
{
  imports = [
    ./hyprland
    ./kde
    ./quickshell
  ];

  environment.systemPackages = with pkgs; [
    wallust
  ];

}
