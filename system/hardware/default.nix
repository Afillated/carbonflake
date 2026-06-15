{config, pkgs, inputs, ...}: {
  imports = [
    ./audio.nix
    ./nvidia.nix
    ./bluetooth.nix    
    ./networking.nix
    ./keyboard.nix
    ./power.nix
  ];
  services.fwupd = {
    enable = true;
  };
}
