{config, pkgs, inputs, ...}: {
  imports = [
    ./filesystems.nix
    ./audio.nix
    ./nvidia.nix
    ./razer.nix
    
  ];
}
