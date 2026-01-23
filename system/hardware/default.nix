{config, pkgs, inputs, ...}: {
  imports = [
    ./filesystems.nix
    ./audio.nix
    ./nvidia.nix
    ./bluetooth.nix    
    ./networking.nix
    ./keyboard.nix
  ];
}
