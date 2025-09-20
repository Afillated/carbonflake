{config, pkgs, inputs, ...}: {
  imports = [
    
    ../hardware/razer.nix
    ../hardware/nvidia.nix
   # comment this on a new machine, should boot and work fine without that but yeah
   # device specific shit
    ../hardware/filesystems.nix


  ];
}
