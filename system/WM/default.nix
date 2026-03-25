{ pkgs, inputs, ... }:
{
  imports = [
    ./hyprland
    ./kde
    ./quickshell
  ];

  environment.systemPackages = with pkgs; [
    inputs.matugen.packages.${system}.default
    wallust
  ];

}
