{ pkgs, inputs, ... }:
{
  imports = [
    ./hyprland
    ./kde
    ./quickshell
    ./niri
  ];

  environment.systemPackages = with pkgs; [
    wallust
  ];

}
