{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    winetricks
    heroic
  ];
}
